package com.gamingfondue.ptb.entities.level
{
	import com.gamingfondue.ptb.entities.Tooltips;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;

	/**
	 * Happy Place map
	 * 
	 * @author Fabio R. Panettieri
	 */
	public class Nirvana extends Entity
	{
		public static const WIDTH:Number = 448;
		public static const HEIGHT:Number = 336;
		
		public var cell_size:int;
		public var player:Point;
		public var tooltips:Tooltips;
		public var spots:Array;
		
		public function Nirvana()
		{
			super(0, 0);
			tooltips = new Tooltips();
			spots = [];
			layer = 1;
			type = "solid";
		}
	}
}