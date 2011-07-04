package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.player.Player;

	import flash.geom.Rectangle;

	import net.flashpunk.Entity;
	
	/**
	 * Represents the player home
     * Used to control game cycles.
	 * Also, as soon as th player enter his home all lights are turned on
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Work extends Entity
	{
		/**
		 * Injected dependecy. Current level televisions
		 */
		public var lights:Array;

		/**
		 * Injected dependecy. Player
		 */
		public var player:Player;

		/**
		 * Work area
		 */
		public var area:Rectangle;

		/**
		 * Indicates if the player it's inside
		 */
		private var inside:Boolean;

		/**
		 * Used to iterate through tvs
		 */
		private var light:Light;
		
		/**
		 * Home constructor
		 */ 
		public function Work()
		{
			super(0, 0);
			inside = false;
		}

		/**
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			// Only update state when all dependencies has been updated
			if(area && player && lights){

				// Turn on tvs when player enters home
				if (!inside && area.contains(player.x, player.y)) {
					inside = true;
					for each (light in lights) {
						light.turnOn();
					}
				}

				// Turn off tvs when player leaves home
				if (inside && !area.contains(player.x, player.y)) {
					inside = false;
					for each (light in lights) {
						light.turnOff();
					}
				}
			}
		}
	}
}
