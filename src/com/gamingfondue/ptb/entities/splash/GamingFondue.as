package com.gamingfondue.ptb.entities.splash
{
	import com.gamingfondue.ptb.constants.Assets;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Tween;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Ease;
	
	public class GamingFondue extends Entity
	{
		private static const BG:uint = 0x101010;
		
		private var display:Image;
		private var tween:ColorTween;
		private var _delay:Alarm;
		private var _onComplete:Function;
		
		public function GamingFondue()
		{
			super(0, 0);
			var bmd:BitmapData = new BitmapData(FP.width, FP.height, false, BG);
			bmd.draw(new Assets.SPLASH);
			display = new Image(bmd);
			display.alpha = 0;
			graphic = display;
			visible = false;
		}
		
		/**
		 * Start the splash screen.
		 */
		public function start(onComplete:Function = null):void
		{
			_onComplete = onComplete;
			visible = true;
			fadeIn();
		}
		
		/**
		 * Update image alpha if tweening
		 */ 
		override public function update():void
		{
			if (tween) display.alpha = tween.alpha;
		}
		
		/**
		 * Fades the splash screen in.
		 */
		private function fadeIn():void
		{
			tween = new ColorTween(delay, Tween.ONESHOT);
			addTween(tween);
			tween.tween(3, BG, BG, 0, 1, Ease.cubeOut);
		}
		
		/**
		 * Delays fade out.
		 */
		private function delay():void
		{
			tween = null;
			_delay = new Alarm(2, fadeOut, Tween.ONESHOT);
			addTween(_delay, true);
		}
		
		/**
		 * Fades the splash screen out.
		 */
		private function fadeOut():void
		{
			tween = new ColorTween(_onComplete, Tween.ONESHOT);
			addTween(tween);
			tween.tween(2, BG, BG, 1, 0, Ease.cubeOut);
		}
		
	}
}