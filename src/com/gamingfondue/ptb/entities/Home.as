package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Layers;
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
		 * Color used to determine work
		 */
		private static const BG:uint = 0xFF303030;
		
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
			layer = Layers.BG;
		}

		/**
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			// Only update state when all dependencies has been updated
			if(_area == null || _player == null || tvs == null) return;

			// Turn on tvs when player enters home
			if (!inside && _area.contains(_player.x, _player.y)) {
				inside = true;
				
				// TODO: fadeOut
				SoundMixer.sonata.stop();
				for each (tv in tvs) {
					tv.turnOn();
				}
			}

			// Turn off tvs when player leaves home
			if (inside && !_area.contains(_player.x, _player.y)) {
				inside = false;
				
				// TODO: fadeIn
				//SoundMixer.sonata.resume();
				for each (tv in tvs) {
					tv.turnOff();
				}
			}
		}
		
		/**
		 * Update home area
		 */ 
		public function set area(area:Rectangle):void
		{
			_area = area;
			x = area.x;
			y = area.y;
			graphic = new Stamp(new BitmapData(area.width, area.height, false, BG));
		}
		
		/**
		 * Inject player dependecy
		 */ 
		public function set player(player:Player):void
		{
			_player = player;
			for each (tv in tvs) {
				tv.player = player;
			}
		}
	}
}
