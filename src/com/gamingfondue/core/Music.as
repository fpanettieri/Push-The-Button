package net.flashpunk 
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
    import flash.utils.Dictionary;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.sound.SfxFader;

	/**
	 * Object used to play background music
	 */
	public class Music extends Entity
	{
		public var added:Boolean;
		
        /**
		 * Creates a music object from an embedded source.
         *
		 * @param	source		The embedded sound class to use.
		 */
		public function Music(source:Class) 
		{
			sfx = new Sfx(source);
			added = false;
			paused = false;
			fader = null;
		}
		
		/**
		 * Added flag
		 */
		override public function added():void
		{
			added = true;
		}
		
		/**
		 * Updates added flag, and clean channels if necessary
		 */
		override public function removed():void
		{
			added = false;
			sfx.stop();
			removeTweens();
		}
		
		public function play():void
		{
			if (paused) sfx.resume();
			else sfx.play();
			paused = false;
		}
		
		public function loop():void
		{
			if (paused) sfx.resume();
			else sfx.loop();
			paused = false;
		}
		
		public function pause():void
		{
			sfx.stop();
			paused = true;
		}
		
		public function stop():void
		{
			sfx.stop();
			paused = false;
		}
		
		
		public function fadeIn(duration:Number = 1, from:Number = 0, to:Number = 1):void
		{
			if (duration < 0 || from >= to ) return;
			fade(duration, from, to);
		}

		public function fadeOut(duration:Number = 1, from:Number = 1, to:Number = 0):void 
		{
			if (duration < 0 || from <= to ) return;
			fade(duration, from, to, pause);
		}
		
		private function fade(duration:Number, from:Number, to:Number, callback:Function = null):void
		{
			removeTweens();
			fader = new SfxFader(sfx, callback, Tween.ONESHOT);
			addTween(fader);
			sfx.vol = from;
			fader.fadeTo(to, duration);
		}
		
		public function get playing():Boolean { return sfx.playing; }
		
		public function get vol():Number { return sfx.volume; }
		public function set vol(value:Number):void { sfx.volume = value; }
		
		public function get pan():Number { return sfx.pan; }
		public function set pan(value:Number):void { sfx.pan = value; }
		
		/**
		 * Real sound
		 */ 
		private var sfx:Sfx;
		
		/**
		 * Function called when fade finishes
		 */ 
		private var fader:SfxFader;
		
		/**
		 * Used to resume playback on special cases
		 */ 
		private var paused:Boolean;
	}
}
