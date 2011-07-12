package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.DayNightCycle;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.util.Logger;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	
	public class Sky extends Entity
	{
		public static var time:int;
		
		// Day/Night cycle duration in seconds
		private var duration:Number;
		private var display:Image;
		private var alarm:Alarm;
		private var tween:ColorTween;
		
		/**
		 * This class represents the sky in the background
		 * It receives the length of the day in seconds
		 */ 
		public function Sky(duration:Number)
		{
			super(0,0);
			this.duration = duration;

			display = new Image(new BitmapData(FP.screen.width, FP.screen.height, true, 0xFFFFFFFF));
			display.color = DayNightCycle.COLORS[0];
			display.scrollX = 0;
			display.scrollY = 0;
			graphic = display;
			layer = Layers.SKY;

			time = DayNightCycle.DAWN;
		}
		
		override public function added():void
		{
			delay();
		}
		
		override public function update():void
		{
			if(tween) display.color = tween.color;
		}
		
		/**
		 * Update color tween
		 */ 
		private function delay():void 
		{
			Logger.log("delay: " + time);
			if (time < DayNightCycle.COLORS.length - 1) {
				alarm = new Alarm(duration * DayNightCycle.DURATION[time], transition, Tween.ONESHOT);
				addTween(alarm, true);
			} else {
				Logger.log("done");
			}
		}

		/**
		 * Update color tween
		 */ 
		private function transition():void 
		{
			Logger.log("transition: " + time);
			tween = new ColorTween(delay, Tween.ONESHOT);
			addTween(tween);
			tween.tween(DayNightCycle.TRANSITION, DayNightCycle.COLORS[time], DayNightCycle.COLORS[time + 1]);
			time++;
		}
	}
}