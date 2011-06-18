package com.gamingfondue.ptb.player
{
	import flash.geom.Point;

	public class State
	{
		public var speed:Point;
		public var acceleration:Point;
		
		public function State()
		{
			speed = new Point();
			acceleration = new Point();
		}
	}
}