package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.util.Logger;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	
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
		private var _player:Player;

		/**
		 * Injected dependecy. Habitable area
		 */
		private var _area:Rectangle;

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
			tvs = [];
			layer = 2;
		}

		/**
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			// Only update state when all dependencies has been updated
			if(_area && _player && tvs){

				// Turn on tvs when player enters home
				if (!inside && _area.contains(_player.x, _player.y)) {
					inside = true;
					for each (tv in tvs) {
						tv.turnOn();
					}
				}

				// Turn off tvs when player leaves home
				if (inside && !_area.contains(_player.x, _player.y)) {
					inside = false;
					for each (tv in tvs) {
						tv.turnOff();
					}
				}
			}
		}
		
		public function set area(area:Rectangle):void
		{
			_area = area;
			x = area.x;
			y = area.y;
			graphic = new Stamp(new BitmapData(area.width, area.height, false, 0xffff00ff));
		}
		
		public function set player(player:Player):void
		{
			_player = player;
			for each (tv in tvs) {
				tv.player = player;
			}
		}
	}
}
