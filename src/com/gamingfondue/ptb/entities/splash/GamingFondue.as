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
		private static const FROM_BG:uint = 0x808080;
		private static const TO_BG:uint = 0x333333;
		
		private var display:Image;
		private var tween:ColorTween;
		private var _delay:Alarm;
		private var _onComplete:Function;

        // Synch
        private const CLIMAX:Number = 15.3;
        private const FADE_IN:Number = 4;
        private const FADE_OUT:Number = 2;
        private var _elapsed:Number;
		
		public function GamingFondue()
		{
			super(0, 0);
			var bmd:BitmapData = new BitmapData(FP.width, FP.height, false, TO_BG);
			bmd.draw(new Assets.SPLASH);
			display = new Image(bmd);
			display.alpha = 0;
			graphic = display;
			visible = false;
		}
		
		/**
		 * Start the splash screen.
		 */
		public function start(elapsed:Number, onComplete:Function = null):void
		{
            _elapsed = elapsed;
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
			tween.tween(FADE_IN, FROM_BG, TO_BG, 0, 1, Ease.cubeOut);
		}
		
		/**
		 * Delays fade out.
		 */
		private function delay():void
		{
			tween = null;
			_delay = new Alarm(CLIMAX - FADE_IN - FADE_OUT - _elapsed, fadeOut, Tween.ONESHOT);
			addTween(_delay, true);
		}
		
		/**
		 * Fades the splash screen out.
		 */
		private function fadeOut():void
		{
			tween = new ColorTween(_onComplete, Tween.ONESHOT);
			addTween(tween);
			tween.tween(FADE_OUT, TO_BG, FROM_BG, 1, 0, Ease.cubeOut);
		}
		
	}
}
