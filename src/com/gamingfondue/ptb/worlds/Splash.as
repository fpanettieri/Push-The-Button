package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.worlds.splash.FlashPunk;
	import com.gamingfondue.ptb.worlds.splash.GamingFondue;
	import com.gamingfondue.ptb.worlds.splash.Menu;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
     * Powered by FlashPunk
     *
     * Gaming Fondue presents
     *
     * Push The Button
     *       * english
     *         español
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

			// TODO: add background music
			
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
			menu.start(menuComplete)
		}
		
		private function menuComplete():void
		{
			FP.world = new Reality();
		}
	}
}
