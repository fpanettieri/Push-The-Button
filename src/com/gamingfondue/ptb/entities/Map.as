package com.gamingfondue.ptb.entities 
{
	import flash.utils.ByteArray;
	import net.flashpunk.masks.Grid;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.utils.Data;
	
	/**
	 * ...
	 * @author Fabio R. Panettieri
	 */
	public class Map extends Entity 
	{
		public var data:XML;
		
		private var tiles:Tilemap;
		private var grid:Grid;
		
		public function Map() 
		{
			grid = new Grid(480, 320, 16, 16, 0, 0);
			mask = grid;
			
			layer = 1;
			type = "level";
			
			grid.setRect(0, 20, 30, 1, true);
		}
		
	}

}