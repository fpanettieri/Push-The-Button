package com.gamingfondue.ptb.entities.splash
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Languages;
	import com.gamingfondue.ptb.entities.Tooltip;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.ResizableText;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Menu extends Entity
	{
		private static const BG:uint = 0x333333;
		
		/**
		 * Background menu image
		 */ 
		private var menu:Image;
		
		/**
		 * Show tween
		 */ 
		private var tween:ColorTween;

		/**
		 * Option to play the game in english
		 */ 
		private var option:Text;
		
		/**
		 * Menu and option marker
		 */
		private var display:Graphiclist;
		
		/**
		 * Callback function
		 */ 
		private var onComplete:Function;
		
		public function Menu()
		{
			super(0, 0);
			var bmd:BitmapData = new BitmapData(FP.width, FP.height, false, BG);
			bmd.draw(new Assets.MENU);
			menu = new Image(bmd);
			option = new Text(".", 263, 195, 16, 16);
			display = new Graphiclist(menu, option);
			graphic = display;
		}
		
		public function start(onComplete:Function = null):void
		{
			this.onComplete = onComplete;
		}
		
		override public function update():void
		{
			// Arrows switch languages
			if (Input.pressed(Key.UP) || Input.pressed(Key.DOWN)) {
				Tooltip.language = 1 - Tooltip.language;
			}
			
			// Select option on mouse down
			if (Input.mouseDown) {
				
				// Mouse in clickeable area
				if (Input.mouseX > 265 && Input.mouseY > 195){
					
					// English
					if (Input.mouseY < 215) {
						Tooltip.language = Languages.EN;
					} else {
						Tooltip.language = Languages.ES;
					}
				}
			}
			
			// Update tooltip position
			if(Tooltip.language == Languages.EN) {
				option.y = 195;
			} else {
				option.y = 205;
			}
			
			// Enter or space select current option
			if (Input.pressed(Key.SPACE) || Input.pressed(Key.ENTER)) {
				onComplete();
			}
			
			// Enter or space select current option
			if (Input.mouseReleased) {
				
				// Mouse in clickeable area
				if (Input.mouseX > 265 && Input.mouseY > 195){
					onComplete();
				}
			}
		}
	}
}