package com.gamingfondue.ptb.levels 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;

	/**
	 * ...
	 * @author Fabio R. Panettieri
	 */
	public class Level extends Entity 
	{
		public var name:String;
		public var cell_size:int;
		
		public function Level() 
		{
			type = "solid";
		}
	}
}