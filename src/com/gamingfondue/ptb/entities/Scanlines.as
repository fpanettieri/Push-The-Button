package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	
	public class Scanlines extends Entity
	{
		private var display:Image;
		public function Scanlines()
		{
			super(0, 0);
			display = new Image(Assets.SCANLINES);
			display.blend = "multiply";
			display.smooth = true;
			graphic = display;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			layer = Layers.SCANLINES;
		}
	}
}