package com.gamingfondue.ptb.entities
{
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Sky extends Entity
	{
		public function Sky()
		{
			super(0,0);
			layer = 4;
			graphic = new Image(new BitmapData(FP.screen.width, FP.screen.height, true, 0xFF300030));
		}
		
		/**
		 * 
		 */ 
		override public function update():void 
		{
			x = FP.camera.x;
			y = FP.camera.y;
		}
	}
}