package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	
	/**
	 * Used to determine if the player has gone to work
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
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			// Only update state when all dependencies has been updated
			if(_area == null || _player == null || buttons == null) return;
				
			// Mark player as worked as soon as he enters workTurn on tvs when player enters work
			if (!_player.worked && _area.contains(_player.x, _player.y)) {
				_player.worked = true;
			}
		}
		
		/**
		 * Update work area
		 */ 
		public function set area(area:Rectangle):void
		{
			_area = area;
			x = area.x;
			y = area.y;
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
