package com.gamingfondue.core
{
	import net.flashpunk.FP;
	import net.flashpunk.World;

	import flash.utils.Dictionary;
	
	/**
	 * This class is used to handle music cross world in FlashPunk
	 */ 
	public class Jukebox
	{
        /**
         * Attach the jukebox to current world
         * This method should be called on World.begin() to ensure consistency
		 * 
		 * Each world that want's to use the functionality provided by Jukebox
		 * should enable it first
         */
        public static function enable():void
        {
			world = FP.world;
        }

        /**
         * Detach the jukebox from current world
         * This method should be called on World.end() to ensure consistency
		 * Remove any reference added to current world
         */
        public static function disable():void
        {
			for each (var music:Music in playlist) {
				if (music.playing) music.pause();
				if (music.added && world) world.remove(music);
			}
			world = null;
        }
		
		/**
		 * Add a new music object to jukebox playlist
		 * In order to reproduce it later, you must add it first
		 * 
		 * @param 	id		Used to identify each track
		 * @param 	source	The embedded sound class to use
		 * @param	force	Override other objects with the same id
		 */ 
		public static function add(id:Object, source:Class, force:Boolean = false):void
		{
			if (force || !playlist[id]) {
				playlist[id] = new Music(source); 
			}
		}
		
		/**
		 * Updates music vol property
		 * 
		 * @param 	id		Used to identify each track
		 * @param	vol		Volume factor, a value from 0 to 1.
		 */ 
		public static function vol(id:Object, vol:Number):void
		{
			if(world == null || !playlist[id]) return;
			playlist[id].vol = vol;
		}
		
		/**
		 * Updates music pan property
		 * 
		 * @param 	id		Used to identify each track
		 * @param	vol		Volume factor, a value from 0 to 1.
		 */ 
		public static function pan(id:Object, pan:Number):void
		{
			if(world == null || !playlist[id]) return;
			playlist[id].pan = pan;
		}
		
		/**
		 * Returns the music object identified by the id parameter
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function get(id:Object):Music
		{
			return playlist[id];
		}
		
		/**
		 * Removes a music object from the playlist and world
		 * Pause it if it's being played
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function remove(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (music.playing) music.stop();
			if (music.added) world.remove(music);
			delete dict[id];
		}
		
		/**
		 * Removes all music objects
		 */ 
		public static function clean():void
		{
			for (var id:Object in playlist) {
				remove(id);
			}
		}
		
		/**
		 * Play the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function play(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (!music.added) world.add(music);
			music.play();
		}
		
		/**
		 * Loops the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function loop(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (!music.added) world.add(music);
			music.loop();
		}
		
		/**
		 * Pauses the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function pause(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (!music.added) world.add(music);
			music.pause();
		}
		
		/**
		 * Stop the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function stop(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (!music.added) world.add(music);
			music.stop();
		}
		
		/**
		 * FadeIn the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function fadeIn(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			playlist[id].fadeIn();
			play(id);
		}
		
		/**
		 * FadeOut the music object identified by the id parameter
		 * If it's not already added to the world, it add it first
		 * 
		 * @param 	id		Used to identify each track
		 */ 
		public static function fadeOut(id:Object):void
		{
			if(world == null || !playlist[id]) return;
			var music:Music = playlist[id];
			if (!music.added) world.add(music);
			music.fadeOut();
		}
		
		
		/**
		 * CrossFade 2 music objects
		 * The first is fadded out, and the second it's fadded in
		 * 
		 * @param 	out		Used to identify the track fadded out
		 * @param 	id		Used to identify the track fadded in
		 */ 
		public static function crossFade(out:Object, id:Object):void
		{
			fadeOut(out);
			fadeIn(id);
		}
		
		/**
		 * Active world. If it's != null, music will be managed in that world 
		 */
		private static var world:World = null;
		
		/**
		 * Jukebox list of music objects
		 */
		private static var playlist:Dictionary = new Dictionary();
    }
}
