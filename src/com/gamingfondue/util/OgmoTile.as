package com.gamingfondue.util
{
	/**
	 * Helper class used to parse OGMO editor tiles
	 * All it's atributes are public to simplify access.
	 * 
	 * @author: Fabio R. Panettieri
	 **/
	public class OgmoTile
	{
		public var column:int;
		public var row:int;
		public var index:int;
		
		private var gridSize:int;
		
		/**
		 * OgmoTile constructor.
		 * 
		 * @param	gridSize How many pixels does each tile use.
		 */ 
		public function OgmoTile(gridSize:int)
		{
			this.gridSize = gridSize;
		}
		
		/**
		 * Parses a XML node describing a Tile	.
		 * Normally used in level grids. 
		 * 
		 * @param	node XML node describing a tile, created by OGMO. 
		 */
		public function parse(node:XML):void
		{
			column = int(node.@x) / gridSize;
			row = int(node.@y) / gridSize;
			index = int(node.@id);
		}
	}
}
