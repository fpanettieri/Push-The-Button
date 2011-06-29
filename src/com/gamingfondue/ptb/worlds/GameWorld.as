package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.Dirt;
	import com.gamingfondue.ptb.levels.Tutorial;
	import com.gamingfondue.ptb.player.Player;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * Game simulation. 
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class GameWorld extends World
	{
		private var billboard:Billboard;
		private var player:Player;
		private var cameraman:Cameraman;
		private var dirt:Dirt;
		private var map:Tutorial;
		private var clock:Entity;
		private var money:Entity;
		private var health:Entity;
		
		/**
		 * GameWorld Constructor
		 * 
		 * Object dependencies are injected after construction
		 */
		public function GameWorld()
		{
			billboard = new Billboard();
			
			player = new Player();
			
			cameraman = new Cameraman();
			cameraman.target = player;
			cameraman.bounds = new Rectangle(0, 0, 704, 496);
			
			dirt = new Dirt();
			dirt.player = player;
			
			map = new Tutorial();
		}
		
		/**
		 * Called when the world is activated.
		 * Adds game actors to the world so the simulatino can run
		 */ 
		override public function begin():void
		{
			add(billboard);
			add(player);
			add(cameraman);
			//add(dirt);
			add(map);
		}
	}
}
