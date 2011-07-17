package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.constants.Constants;
	import com.gamingfondue.ptb.entities.Billboard;
	import com.gamingfondue.ptb.entities.Cameraman;
	import com.gamingfondue.ptb.entities.HUD;
	import com.gamingfondue.ptb.entities.Sky;
	import com.gamingfondue.ptb.entities.level.Level;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.entities.level.Nirvana;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
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
			billboard = new Billboard();
			
			cameraman = new Cameraman();
			cameraman.bounds = new Rectangle(0, 0, level.width, level.height);
			cameraman.target = player;
			
			hud = new HUD();
			HUD.age = Levels.number + Constants.LEGAL_AGE;
			
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
			if (Input.mousePressed) {
				FP.world = new Transition(new HappyPlace());
			}
		}
	}
}
