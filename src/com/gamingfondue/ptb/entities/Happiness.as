package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	/**
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Happiness extends Entity
	{
		/**
		 * Happiness image
		 */
		private var image:Image;
		
		/**
		 * Happiness touch sfx
		 */
		private var sfx:Sfx;
		
		public function Happiness()
		{
			super();
			sfx = new Sfx(Assets.MONEY);
			
			image = new Image(Assets.HAPPINESS);
			graphic = image;
			setHitbox(12, 12, -2, -2);

			layer = Layers.OBJECTS;
			visible = false;
		}
		
		override public function update():void
		{
			if (!visible) return;
			if (collide(Types.PLAYER, x, y)) {
				HUD.happiness++;
				sfx.play();
				visible = false;
			}
		}
	}
}