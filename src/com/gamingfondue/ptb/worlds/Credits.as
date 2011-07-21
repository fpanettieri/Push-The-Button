package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.credits.Background;
	import com.gamingfondue.ptb.entities.credits.Floor;
	import com.gamingfondue.ptb.entities.credits.Front;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.ptb.entities.player.behavior.Behaviors;
	
	import flash.geom.Rectangle;
	
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
		 * Called when the world is activated.
		 * It initializes texts and places them on screen.
		 */ 
		override public function begin():void
		{
			player = new Player(-128, 0, Behaviors.DEAD);
			
			billboard = new Billboard();
			// TODO: set msgs
			Billboard.size = 10000;
			
			Billboard.notify("aca va manso mensaje");
			Billboard.notify("Y uno triste");

			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(-1024, 0, 2048, 256);
			cameraman.target = player;
			
			bg = new Background();
			floor = new Floor();
			front = new Front();
			
			add(bg);
			add(player);
			add(floor);
			add(front);
			add(cameraman);
			add(billboard);

			balrog = new Sfx(Assets.BALROG);
			balrog.loop(0.3);
		}
		
		/**
		 * Restarts the demo on mouse click.
		 */ 
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.R)) {
				FP.world = new Splash();
			}
		}
		
		/**
		 * Stop music
		 */ 
		override public function end():void
		{
			balrog.stop();
		}
	}
}