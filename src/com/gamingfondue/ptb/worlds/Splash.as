package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Title;
	import com.gamingfondue.ptb.worlds.splash.FlashPunk;
	import com.gamingfondue.ptb.worlds.splash.GamingFondue;
	import com.gamingfondue.ptb.worlds.splash.Menu;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	/**
     * Powered by FlashPunk
     *
     * Gaming Fondue presents
     *
     * Push The Button
     * * english *
     * español
     *
	 * [fancy transition]
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Splash extends World
	{
        /**
		 * FlashPunk splash screen
		 */ 
		private var fp:FlashPunk;

        /**
		 * GamingFondue splash screen
		 */ 
		private var gf:GamingFondue;
		
		/**
		 * Menu screen
		 */
		private var menu:Menu;

		/**
		 * Called when the world is activated.
		 * It creates the bounce effect of the title.
		 */ 
		override public function begin():void
		{
            fp = new FlashPunk(0xFF9900, 0x333333, 1);
			gf = new GamingFondue();
			menu = new Menu();

			add(fp);
            fp.start(fpComplete);
		}

        private function fpComplete():void
        {
			add(gf);
			remove(fp);
            gf.start(gfComplete);
        }
		
		private function gfComplete():void
		{
			add(menu);
			remove(gf);
			FP.world = new Reality();
		}
	}
}
