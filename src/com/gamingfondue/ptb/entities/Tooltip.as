package com.gamingfondue.ptb.entities
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	public class Tooltip extends Entity
	{
		private var en:String;
		private var es:String;
		private var rect:Rectangle;
		
		public function Tooltip(x:Number, y:Number, width:Number, height:Number, en:String, es:String)
		{
			super(x, y);
			rect = new Rectangle(x, y, width, height);
			this.en = en;
			this.es = es;
		}
		
		public function intersects(x:Number, y:Number):Boolean
		{
			return rect.contains(x,y);	
		}
			
		public function get msg():String
		{
			// TODO: Use desired language
			return es;
		}
	}
}