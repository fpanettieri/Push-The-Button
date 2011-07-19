package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	/**
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Button extends Entity
	{
		/**
		 * Injected dependency
		 */ 
		public var player:Player;
		
		/**
		 * Indicates if the button has been pressed
		 */
		private var pressed:Boolean;
		
		/**
		 * Button image
		 */
		private var image:Image;
		
		/**
		 * How much does the company pays you for pressing this button
		 */
		private var money:Number;
		
		/**
		 * Button press sfx
		 */
		private var sfx:Sfx;
		
		/**
		 * Title constructor.
		 */ 
		public function Button(x:Number = 0, y:Number = 0, money:Number = 0)
		{
			super(x, y);
			this.money = money;
			
			sfx = new Sfx(Assets.MONEY);
			
			image = new Image(Assets.BUTTON);
			image.color = 0xFFE02020;
			graphic = image;
			setHitbox(8, 8, -4, -4);

			layer = Layers.OBJECTS;
			pressed = false;
		}
		
		override public function update():void
		{
			if (pressed) return;
			if (collide(Types.PLAYER, x, y)) {
				pressed = true;
				player.insatisfaction += 1;
				image.color = 0xFF30E030;
				HUD.money += money;
				sfx.play();
			}
		}
	}
}
