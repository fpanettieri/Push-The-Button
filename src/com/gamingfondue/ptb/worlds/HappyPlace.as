package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Constants;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.HUD;
	import com.gamingfondue.ptb.entities.Happiness;
	import com.gamingfondue.ptb.entities.NirvanaSky;
	import com.gamingfondue.ptb.entities.Spawner;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.entities.level.Nirvana;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.ptb.entities.player.behavior.Behaviors;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.Tween;
	import net.flashpunk.World;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * World where the player buys happines with money.
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class HappyPlace extends World
	{
		private var sky:NirvanaSky;
		private var nirvana:Nirvana;
		private var happiness:Happiness;
		private var spawner:Spawner;
		private var player:Player;
		private var billboard:Billboard;
		private var cameraman:Cameraman;
		private var hud:HUD;
		
		/**
		 * Last played position
		 */ 
		public static var position:Number = 0;
		
		/**
		 * Background music
		 */
		private var sonata:Sfx;
		
		/**
		 * Used to fade sonata in
		 */
		private var fader:SfxFader;
		
		/**
		 * Called when the world is activated.
		 * Adds game actors to the world so the simulatino can run
		 */ 
		override public function begin():void
		{
			nirvana = Levels.nirvana();
			sky = new NirvanaSky();
			player = new Player(nirvana.player.x, nirvana.player.y, Behaviors.HAPPY);
			nirvana.tooltips.player = player;
			happiness = new Happiness();
			
			spawner = new Spawner();
			spawner.spots = nirvana.spots;
			spawner.happiness = happiness;
			
			billboard = new Billboard();
			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(0, 0, nirvana.width, nirvana.height);
			cameraman.target = player;
			
			hud = new HUD();
			
			add(sky);
			add(nirvana);
			add(player);
			add(cameraman);
			add(billboard);
			add(hud);
			add(nirvana.tooltips);
			add(spawner);
			add(happiness);
			
			sonata = new Sfx(Assets.SONATA_HAPPY);
			playSonata();
		}
		
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.M)){
				FP.volume = 1 - FP.volume;
			}
		}
		
		override public function end():void
		{
			stopSonata()
		}
		
		/**
		 * Start playing sonata
		 */ 
		private function playSonata():void
		{
			fader = new SfxFader(sonata, null, Tween.ONESHOT);
			sonata.loop(0.1, 0, position);
			addTween(fader);
			fader.fadeTo(1, 1);
		}
		
		/**
		 * Pause sonata and store position
		 */ 
		private function stopSonata():void
		{
			position = sonata.position * 1000;
			sonata.stop();
		}
	}
}