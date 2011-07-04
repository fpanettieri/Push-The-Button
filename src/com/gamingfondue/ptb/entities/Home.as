package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.player.Player;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	
	/**
	 * Represents the player home
     * Used to control game cycles.
	 * Also, as soon as th player enter his home all televisions are turned on
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Home extends Entity
	{
		/**
		 * Injected dependecy. Current level televisions
		 */
		public var tvs:Array;

		/**
		 * Injected dependecy. Player
		 */
		public var player:Player;

		/**
		 * Injected dependecy. Habitable area
		 */
		public var area:Rectangle;

		/**
		 * Indicates if the player it's inside home
		 */
		private var inside:Boolean;

		/**
		 * Used to iterate through tvs
		 */
		private var tv:Tv;
		
		/**
		 * Home constructor
		 */ 
		public function Home()
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
			if(area && player && tvs){

				// Turn on tvs when player enters home
				if (!inside && area.contains(player.x, player.y)) {
					Logger.log("Enters home");
					inside = true;
					for each (tv in tvs) {
						tv.turnOn();
					}
				}

				// Turn off tvs when player leaves home
				if (inside && !area.contains(player.x, player.y)) {
					Logger.log("Leaves home");
					inside = false;
					for each (tv in tvs) {
						tv.turnOff();
					}
				}
			}
		}
	}
}
