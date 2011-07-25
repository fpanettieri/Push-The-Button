package com.gamingfondue.ptb
{
	import Playtomic.Log;
	
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.worlds.Credits;
	import com.gamingfondue.ptb.worlds.Reality;
	import com.gamingfondue.ptb.worlds.Splash;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class PushTheButton extends Engine
	{
		/**
		 * Initializes FlashPunk engine
		 */ 
		public function PushTheButton()
		{
			super(320, 240, 30, false);
			FP.screen.scale = 2;
			//Log.View(3639, "0a7e983cf8a24f2f", root.loaderInfo.loaderURL);
			FP.console.enable();
		}
		
		/**
		 * Set the splash screen in the engine
		 */
		override public function init():void
		{
			// Create first world
			//FP.world = new Splash();
			FP.world = new Reality();
			//FP.world = new Credits();
		} 
	}
}
