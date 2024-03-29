package com.gamingfondue.ptb.worlds
{
	import Playtomic.Log;
	
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Languages;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.Statistics;
	import com.gamingfondue.ptb.entities.credits.Background;
	import com.gamingfondue.ptb.entities.credits.EnglishCredits;
	import com.gamingfondue.ptb.entities.credits.Floor;
	import com.gamingfondue.ptb.entities.credits.Front;
	import com.gamingfondue.ptb.entities.credits.SpanishCredits;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.ptb.entities.player.behavior.Behaviors;
	
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * The last screen of the game. 
	 * It shows my name and contact info. 
	 * Also restart the game if clicked.
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Credits extends World
	{
		/**
		 * Dead player
		 */ 
		private var player:Player;
		
		/**
		 * Notifications
		 */ 
		private var billboard:Billboard;
		
		/**
		 * Cameraman follows player
		 */ 
		private var cameraman:Cameraman;
		
		/**
		 * Background image
		 */
		private var bg:Background;
		
		/**
		 * Floor image
		 */
		private var floor:Floor;
		
		/**
		 * Front image
		 */
		private var front:Front;
		
		/**
		 * Background music
		 */
		private var balrog:Sfx;
		
		/**
		 * Used to fade sonata in
		 */
		private var fader:SfxFader;
		
		/**
		 * Flag used to pause game
		 */
		private var paused:Boolean;
		
		/**
		 * Called when the world is activated.
		 * It initializes texts and places them on screen.
		 */ 
		override public function begin():void
		{
			Statistics.end = getTimer();
			player = new Player(-128, 0, Behaviors.DEAD);
			
			billboard = new Billboard();
			Billboard.queue = Statistics.language == Languages.EN ? EnglishCredits.queue : SpanishCredits.queue;
			
			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(-1024, 0, 2048, 256);
			cameraman.target = player;
			
			bg = new Background();
			floor = new Floor();
			front = new Front();

			// Log level
			Log.CustomMetric("Credits");

			add(bg);
			add(player);
			add(floor);
			add(front);
			add(cameraman);
			add(billboard);

			balrog = new Sfx(Assets.BALROG);
			balrog.loop();
			
			paused = false;
		}
		
		/**
		 * Restarts the demo on mouse click.
		 */ 
		override public function update():void
		{
			if (!paused) super.update();
			
			// Restart
			if (Input.pressed(Key.R)) {
				FP.world = new Splash();
			}
			
			// Sound mute
			if (Input.pressed(Key.M)){
				FP.volume = 1 - FP.volume;
			}
			
			// Game pause
			if (Input.pressed(Key.P)){
				paused = !paused;
			}
		}
		
		/**
		 * Stop music
		 */ 
		override public function end():void
		{
			balrog.stop();
			clearTweens()
			removeAll();
		}
	}
}
