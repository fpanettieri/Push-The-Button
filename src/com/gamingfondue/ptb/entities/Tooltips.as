package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.entities.player.Player;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	public class Tooltips extends Entity
	{
		/**
		 * Injected dependecy
		 */
		public var player:Player;
		
		/**
		 * Parsed tooltip array
		 */ 
		public var tooltips:Array;
		
		// Used to iterate array
		private var tooltip:Tooltip;
		public function Tooltips()
		{
			super(0, 0);
			tooltips = [];
		}
		
		public function add(tooltip:Tooltip):void
		{
			tooltips.push(tooltip);
		}
		
		public function remove(tooltip:Tooltip):void
		{
			tooltips.splice(tooltips.indexOf(tooltip), 1);
		}
		
		override public function update():void
		{
			for each (tooltip in tooltips) {
				if(tooltip.intersects(player.x, player.y)) {
					Billboard.notify(tooltip.msg);
					remove(tooltip);
				}
			}
		}
	}
}