package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.player.Player;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * World where the player buys happines with money.
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class HappyPlace extends World
	{
		private var player:Player;
		private var billboard:Billboard;
		private var money:Entity;
		private var clock:Entity;
		
		/**
		 * GameWorld Constructor
		 * 
		 * Object dependencies are injected after construction
		 */
		public function GameWorld()
		{
			billboard = new Billboard();
			
			player = new Player();
		}
		
		/**
		 * Called when the world is activated.
		 * Adds game actors to the world so the simulatino can run
		 */ 
		override public function begin():void
		{
			add(billboard);
			add(player);
		}
	}
}