package com.gamingfondue.ptb
{
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
			//FP.console.enable();
		}
		
		/**
		 * Set the slpash screen in the engine
		 */
		override public function init():void
		{
			//FP.world = new Splash();
			FP.world = new Reality();
		} 
	}
}