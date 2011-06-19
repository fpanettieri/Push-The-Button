package com.gamingfondue.ptb.levels 
{
	import com.gamingfondue.ptb.Assets;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
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
			grid = new Grid(1024, 1024, 8, 8, 0, 0);
			mask = grid;
			
			tiles = new Tilemap(Assets.WALL, 1024, 1024, 8, 8);
			graphic = tiles;
			
			layer = 1;
			type = "solid";
			
			grid.setRect(0, 20, 30, 1, true);
			tiles.setRect(0, 20, 30, 1, 1);
			
			grid.setRect(5, 16, 1, 4, true);
			tiles.setRect(5, 16, 1, 4, 1);
		}
	}
}