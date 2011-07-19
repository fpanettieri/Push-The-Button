package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.entities.level.Levels;
	import com.gamingfondue.ptb.worlds.Credits;
	import com.gamingfondue.ptb.worlds.Reality;
	import com.gamingfondue.ptb.worlds.WorldTransition;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.Alarm;
	
	public class Spawner extends Entity
	{
		/**
		 * Max delay between happiness spawns
		 */
		private const DELAY_MIN:Number = 10;
		
		/**
		 * Min delay between happiness spawns
		 */
		private const DELAY_MARGIN:Number = 10;
		
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
		 * Called on level construction
		 */ 
		override public function added():void
		{
			spawn();
		}
		
		/**
		 * Used to delay the next spawn
		 */
		private function delay():void
		{
			_delay = new Alarm(Math.random() * DELAY_MARGIN + DELAY_MIN, spawn, Tween.ONESHOT);
			addTween(_delay, true);
		}
		
		/**
		 * Spawn random happiness
		 */
		private function spawn():void
		{
			// Return to reality when money it's not enough to spawn new happiness
			if(HUD.money < Levels.number)  {
				
				// If this is the last level we show the final world
				if (Levels.number == Levels.last) {
					FP.world = new WorldTransition(new Credits());
				} else {
					FP.world = new WorldTransition(new Reality());
				}
				return;
			}
			
			// Money decreases each time happiness spawns
			HUD.money -= Levels.number;
			
			// Choose random spot and move happiness there
			spot = FP.choose(spots);
			happiness.x = spot.x;
			happiness.y = spot.y;
			happiness.visible = true;
			
			delay();
		}
	}
}