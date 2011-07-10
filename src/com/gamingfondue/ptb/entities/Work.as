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
		 * Injected dependecy. Current level buttons
		 */
		public var buttons:Array;

		/**
		 * Injected dependecy. Player
		 */
		public var player:Player;

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
		private var button:Entity;
		
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
		 * 
		 */ 
		override public function update():void 
		{
		}
		
		/**
		 * 
		 */ 
		public function set area(area:Rectangle):void
		{
			_area = area;
			x = area.x;
			y = area.y;
			graphic = new Stamp(new BitmapData(area.width, area.height, false, 0xffff00ff));
		}
	}
}
