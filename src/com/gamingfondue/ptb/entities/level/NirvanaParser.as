package com.gamingfondue.ptb.entities.level
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.entities.Button;
	import com.gamingfondue.ptb.entities.Tooltip;
	import com.gamingfondue.ptb.entities.Tv;
	import com.gamingfondue.util.OgmoRect;
	import com.gamingfondue.util.OgmoTile;
	import com.gamingfondue.util.XMLReader;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class NirvanaParser
	{
		public function parse(oel:Class):Nirvana
		{
			var level:Nirvana = new Nirvana();
			
			// Extract embedded level
			var reader:XMLReader = new XMLReader();
			var xml:XML = reader.read(oel);
			
			// Aux variable used to iterate level
			var node:XML;
			
			level.width = xml.width;
			level.height = xml.height;
			level.cell_size = xml.@cell_size;
			
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
			
			// Player entrance
			level.player = new Point(xml.objects.entrance.@x, xml.objects.entrance.@y);
			
			// tooltips
			for each(node in xml.tooltips.tooltip) {
				level.tooltips.add(new Tooltip(node.@x, node.@y, node.@width, node.@height, node.@en, node.@es));
			}
			
			// happy spots
			for each(node in xml.objects.happiness) {
				level.spots.push(new Point(node.@x, node.@y));
			}
			
			return level;
		}
	}
}