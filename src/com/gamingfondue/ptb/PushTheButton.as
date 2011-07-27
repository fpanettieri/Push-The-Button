package com.gamingfondue.ptb
{
	import Playtomic.Log;
	
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.worlds.Credits;
	import com.gamingfondue.ptb.worlds.Reality;
	import com.gamingfondue.ptb.worlds.Splash;
	
	import flash.events.Event;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width = "640", height = "480")]
	public class PushTheButton extends Engine
	{
		/**
		 * Used to store volume on focus lost
		 */
		private var volume:Number;
		
		
		/**
		 * Initializes FlashPunk engine
		 */ 
		public function PushTheButton()
		{
			super(320, 240, 30, false);
			FP.screen.scale = 2;
			volume = FP.volume;
			Log.View(3639, "0a7e983cf8a24f2f", root.loaderInfo.loaderURL);
			addEventListener(Event.ACTIVATE, onActivate);
			addEventListener(Event.DEACTIVATE, onDeactivate);
		}

		public function onDeactivate(e:Event = null):void
		{
			volume = FP.volume;
			FP.volume = 0;
		}	
		
		public function onActivate(e:Event = null):void
		{
			FP.volume = volume;
		}
		
		/**
		 * Set the splash screen in the engine
		 */
		override public function init():void
		{
			FP.world = new Splash();
		} 
		
		
		
	}
}
