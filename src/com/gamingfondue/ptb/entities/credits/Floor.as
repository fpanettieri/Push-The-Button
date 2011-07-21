package com.gamingfondue.ptb.entities.credits
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Backdrop;
	
	public class Floor extends Entity
	{
		public function Floor()
		{
			super(0, 0);
			graphic = new Backdrop(Assets.CREDITS_FLOOR, true, false);
			layer = Layers.CREDITS_FLOOR;
		}
	}
}