package com.gamingfondue.ptb.entities.credits
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Backdrop;
	
	public class Background extends Entity
	{
		public function Background()
		{
			super(0, 0);
			graphic = new Backdrop(Assets.CREDITS_BG, true, false);
			graphic.scrollX = 0.5;
			layer = Layers.CREDITS_BG;
		}
	}
}