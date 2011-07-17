package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.constants.Constants;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.HUD;
	import com.gamingfondue.ptb.entities.NirvanaSky;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.entities.level.Nirvana;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.ptb.entities.player.behavior.Behaviors;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * World where the player buys happines with money.
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class HappyPlace extends World
	{
		private var sky:NirvanaSky;
		private var nirvana:Nirvana;
		private var player:Player;
		private var billboard:Billboard;
		private var cameraman:Cameraman;
		private var hud:HUD;
		
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
			
			// TODO: ADD happy spawner
			
			billboard = new Billboard();
			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(0, 0, nirvana.width, nirvana.height);
			cameraman.target = player;
			
			hud = new HUD();
			HUD.age = Levels.number + Constants.LEGAL_AGE;
			
			add(sky);
			add(nirvana);
			add(player);
			add(cameraman);
			add(billboard);
			add(hud);
			add(nirvana.tooltips);
			// TODO: Add nirvana spawner
			
		}
	}
}