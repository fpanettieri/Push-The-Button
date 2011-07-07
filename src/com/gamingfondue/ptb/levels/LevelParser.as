package com.gamingfondue.ptb.levels
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.util.OgmoRect;
	import com.gamingfondue.util.OgmoTile;
	import com.gamingfondue.util.XMLReader;
	
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;

	public class LevelParser
	{
		public function parse(oel:Class):Level
		{
			var level:Level = new Level();
			
			// Extract embedded level
			var reader:XMLReader = new XMLReader();
			var xml:XML = reader.read(oel);
			
			// Aux variable used to iterate level
			var node:XML;
			
			level.name = xml.@name;
			level.cell_size = xml.@cell_size;
			level.width = xml.width;
			level.height = xml.height;
			
			// Create collision grid
			var grid:Grid = new Grid(level.width, level.height, level.cell_size, level.cell_size, 0, 0);
			var rect:OgmoRect = new OgmoRect(level.cell_size);
			for each(node in xml.collision.rect) {
				rect.parse(node);
				grid.setRect(rect.x, rect.y, rect.w, rect.h, true);
			}
			level.mask = grid;

			// Create map tiles
			var tiles:Tilemap = new Tilemap(Assets.WALL, level.width, level.height, level.cell_size, level.cell_size);
			var tile:OgmoTile = new OgmoTile(level.cell_size);
			for each(node in xml.wall.tile) {
				tile.parse(node);
				tiles.setTile(tile.column, tile.row, tile.index);
			}
			level.graphic = tiles;
			level.layer = 1;
			
			return level;
		}
	}
}