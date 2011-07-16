package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Languages;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	public class Tooltip extends Entity
	{
		public static var language:int = Languages.EN;
		
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
			return language == Languages.EN ? en : es;
		}
	}
}