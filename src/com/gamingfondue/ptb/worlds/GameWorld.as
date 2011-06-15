package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.Map;
	import com.gamingfondue.ptb.entities.Player;
	
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
		private var map:Map;
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
			map = new Map();
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
			add(map);
		}
	}
}
