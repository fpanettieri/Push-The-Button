package com.gamingfondue.ptb.entities.credits
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Backdrop;
	
	public class Front extends Entity
	{
		public function Front()
		{
			super(0, 0);
			graphic = new Backdrop(Assets.CREDITS_FRONT, true, false);
			graphic.scrollX = 1.5;
			layer = Layers.CREDITS_FRONT;
			
		}
	}
}