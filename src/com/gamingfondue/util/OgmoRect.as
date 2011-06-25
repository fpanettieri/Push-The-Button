package com.gamingfondue.util
{
	/**
	 * Helper class used to parse level created with OGMO.  
	 * All it's atributes are public to simplify access.
	 * 
	 * @author: Fabio R. Panettieri
	 */
	public class OgmoRect
	{
		public var x:int;
		public var y:int;
		public var w:int;
		public var h:int;
		
		private var gridSize:int;
		
		/**
		 * OgmoRect constructor.
		 * 
		 * @param	gridSize How many pixels does each cell use.
		 */ 
		public function OgmoRect(gridSize:int)
		{
			this.gridSize = gridSize;
		}
		
		/**
		 * Parses a XML node describing a Rect.
		 * Normally used in collision grids. 
		 * 
		 * @param	node XML node describing a rect, created by OGMO. 
		 */
		public function parse(node:XML):void
		{
			x = int(node.@x) / gridSize;
			y = int(node.@y) / gridSize;
			w = int(node.@w) / gridSize;
			h = int(node.@h) / gridSize;
		}
	}
}
