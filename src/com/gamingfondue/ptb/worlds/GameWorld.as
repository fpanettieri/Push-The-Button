package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.Dirt;
	import com.gamingfondue.ptb.entities.Home;
	import com.gamingfondue.ptb.entities.Light;
	import com.gamingfondue.ptb.entities.Tv;
	import com.gamingfondue.ptb.entities.Work;
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
		private var tvs:Array;
		private var home:Home;
		private var lights:Array;
		private var work:Work;
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

			tvs = [new Tv(240, 440)];
			tvs[0].player = player;

			home = new Home();
			home.tvs = tvs;
			home.player = player;
			home.area = new Rectangle(0, 200, 704, 496);

			lights = [new Light()];

			work = new Work();
			work.lights = lights;
			work.player = player;
			work.area = new Rectangle(0, 300, 4, 100);
			
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
			add(dirt);
			addList(tvs);
			add(home);
			add(work);
			add(map);
		}
	}
}
