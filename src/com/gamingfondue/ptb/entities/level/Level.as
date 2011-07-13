package com.gamingfondue.ptb.entities.level 
{
	import com.gamingfondue.ptb.entities.Home;
	import com.gamingfondue.ptb.entities.Tooltips;
	import com.gamingfondue.ptb.entities.Work;
	
	import flash.geom.Point;
	
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
		public var duration:int;
		
		public var player:Point;
		public var home:Home;
		public var work:Work;
		public var tooltips:Tooltips;
		
		public function Level() 
		{
			home = new Home();
			work = new Work();
			tooltips = new Tooltips();
			layer = 1;
			type = "solid";
		}
	}
}