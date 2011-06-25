package com.gamingfondue.ptb.levels 
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Levels;
	import com.gamingfondue.util.OgmoRect;
	import com.gamingfondue.util.OgmoTile;
	import com.gamingfondue.util.XMLReader;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.utils.Data;
	
	/**
	 * ...
	 * @author Fabio R. Panettieri
	 */
	public class Tutorial extends Level
	{
		public var data:XML;
		
		private var tiles:Tilemap;
		private var grid:Grid;
		
		public function Tutorial() 
		{
			grid = new Grid(704, 496, CELL_SIZE, CELL_SIZE, 0, 0);
			mask = grid;
			
			tiles = new Tilemap(Assets.WALL, 704, 496, CELL_SIZE, CELL_SIZE);
			graphic = tiles;
			
			layer = 1;
			type = "solid";
			
			// Extract embedded level
			var reader:XMLReader = new XMLReader();
			var level:XML = reader.read(Levels.TUTORIAL);
			
			// Aux variable used to iterate level
			var node:XML;
			
			// Create map tiles
			var tile:OgmoTile = new OgmoTile(CELL_SIZE);
			for each(node in level.wall.tile) {
				tile.parse(node);
				tiles.setTile(tile.column, tile.row, tile.index);
			}
			
			// Create collision grid
			var rect:OgmoRect = new OgmoRect(CELL_SIZE);
			for each(node in level.collision.rect) {
				rect.parse(node);
				grid.setRect(rect.x, rect.y, rect.w, rect.h, true);
			}
		}
	}
}