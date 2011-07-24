package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.entities.level.Level;
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.worlds.Credits;
	import com.gamingfondue.ptb.worlds.Reality;
	import com.gamingfondue.ptb.worlds.WorldTransition;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.Alarm;
	
	public class Spawner extends Entity
	{
		/**
		 * Max delay between happiness spawns
		 */
		private const DELAY_MIN:Number = 8;
		
		/**
		 * Min delay between happiness spawns
		 */
		private const DELAY_MARGIN:Number = 12;
		
		/**
		 * Injected Dependency. Happiness
		 */ 
		public var happiness:Happiness;
		
		/**
		 * Injected Dependency. Possible Happiness spots
		 */ 
		public var spots:Array;

		/**
		 * Selected spot
		 */
		private var spot:Point;
		
		/**
		 * Alarm used to delay each spawn
		 */ 
		private var _delay:Alarm;
		
		/**
		 * Last spawn spot
		 */
		private var last:Point = new Point();
		
		/**
		 * Happiness cost
		 */
		private var cost:Number;
		
		/**
		 * If the player touched happiness it skips to the next level
		 */
		override public function update():void
		{
			if (!happiness.visible) spawn();
		}
		
		/**
		 * Used to delay the next spawn
		 */
		private function delay():void
		{
			_delay = new Alarm(FP.rand(DELAY_MARGIN) + DELAY_MIN, spawn, Tween.ONESHOT);
			addTween(_delay, true);
		}
		
		/**
		 * Spawn random happiness
		 */
		private function spawn():void
		{
			// Remove previous alarm
			clearTweens();
			
			// A random value between the last 
			cost = Math.pow(2, Levels.number - 1);
			
			// Return to reality when money it's not enough to spawn new happiness
			if(HUD.money < cost)  {
				
				// If this is the last level we show the final world
				if (Levels.number >= Levels.last) {
					FP.world = new WorldTransition(new Credits());
				} else {
					FP.world = new WorldTransition(new Reality());
				}
				return;
			}
			
			// Money decreases each time happiness spawns
			HUD.money -= cost;
			
			// Choose random spot and move happiness there
			do {
				spot = FP.choose(spots);
			} while(spot.equals(last));
			last = spot;
			happiness.x = spot.x;
			happiness.y = spot.y;
			happiness.visible = true;
			
			delay();
		}
	}
}