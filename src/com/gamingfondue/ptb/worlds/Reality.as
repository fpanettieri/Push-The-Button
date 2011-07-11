package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.constants.Constants;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.HUD;
	import com.gamingfondue.ptb.entities.Sky;
	import com.gamingfondue.ptb.entities.level.Level;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	/**
	 * Game simulation. 
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class Reality extends World
	{
		private var sky:Sky;
		private var level:Level;
		private var player:Player;
		private var billboard:Billboard;
		private var cameraman:Cameraman;
		private var hud:HUD;
		
		/**
		 * GameWorld Constructor
		 * 
		 * Object dependencies are injected after construction
		 */
		public function Reality()
		{
			sky = new Sky();
			level = Levels.next();
			
			player = new Player(level.player.x, level.player.y);
			level.home.player = player;
			level.work.player = player;
			billboard = new Billboard();
			
			cameraman = new Cameraman();
			cameraman.target = player;
			cameraman.bounds = new Rectangle(0, 0, level.width, level.height);

			hud = new HUD();
			HUD.age = Levels.number + Constants.LEGAL_AGE;
		}
		
		/**
		 * Called when the world is activated.
		 * Adds game actors to the world so the simulatino can run
		 */ 
		override public function begin():void
		{
			add(sky);
			add(level);
			add(level.home);
			addList(level.home.tvs);
			add(level.work);
			addList(level.work.buttons);
			add(player);
			add(cameraman);
			add(billboard);
			add(hud);
		}
	}
}
