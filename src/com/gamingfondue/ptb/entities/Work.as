package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	
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
		 * Color used to determine work
		 */
		private static const BG:uint = 0xFF303030;
		
		/**
		 * Injected dependecy. Current level buttons
		 */
		public var buttons:Array;

		/**
		 * Injected dependecy. Player
		 */
		private var _player:Player;

		/**
		 * Work area
		 */
		private var _area:Rectangle;

		/**
		 * Indicates if the player it's inside
		 */
		private var inside:Boolean;
		
		/**
		 * Used to iterate through buttons
		 */ 
		private var button:Button;
		
		/**
		 * Home constructor
		 */ 
		public function Work()
		{
			super(0, 0);
			inside = false;
			buttons = [];
			layer = Layers.BG;
		}
		
		/**
		 * Update work area
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
			for each (button in buttons) {
				button.player = player;
			}
		}
	}
}
