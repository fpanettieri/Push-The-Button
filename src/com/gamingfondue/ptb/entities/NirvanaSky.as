package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.DayNightCycle;
	import com.gamingfondue.ptb.constants.Layers;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class NirvanaSky extends Entity
	{
		private var display:Image;
		public function NirvanaSky()
		{
			super(0, 0);
			display = new Image(new BitmapData(FP.screen.width, FP.screen.height, true, 0x333333));
			display.color = DayNightCycle.COLORS[0];
			display.scrollX = 0;
			display.scrollY = 0;
			graphic = display;
			layer = Layers.SKY;
		}
	}
}