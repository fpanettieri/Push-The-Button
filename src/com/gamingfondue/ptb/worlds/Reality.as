package com.gamingfondue.ptb.worlds
{
	import Playtomic.Log;
	
	import com.gamingfondue.ptb.constants.Constants;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.HUD;
	import com.gamingfondue.ptb.entities.Sky;
	import com.gamingfondue.ptb.entities.Statistics;
	import com.gamingfondue.ptb.entities.level.Level;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
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
		 * Called when the world is activated.
		 * Adds game actors to the world so the simulation can run
		 */ 
		override public function begin():void
		{
			level = Levels.next();
			sky = new Sky(level.duration);
			
			player = new Player(level.player.x, level.player.y);
			level.home.player = player;
			level.work.player = player;
			level.tooltips.player = player;
			billboard = new Billboard(0, 222);
			
			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(0, 0, level.width, level.height);
			cameraman.target = player;
			
			hud = new HUD();
			Statistics.age = Levels.number * 4 + Constants.BASE_AGE;
			HUD.age = Statistics.age;

			// Log level
			Log.LevelCounterMetric("L", Levels.number);
			
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
			add(level.tooltips);
		}
		
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.M)){
				FP.volume = 1 - FP.volume;
			}
			if (Input.pressed(Key.N)) {
				HUD.money = 24;
				FP.world = new WorldTransition(new HappyPlace());
			}
		}
		
		override public function end():void
		{
			clearTweens()
			removeAll();
			Statistics.money += HUD.money;
		}
	}
}
