package com.gamingfondue.ptb.worlds
{
	import Playtomic.Log;
	
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.entities.Statistics;
	import com.gamingfondue.ptb.entities.splash.FlashPunk;
	import com.gamingfondue.ptb.entities.splash.GamingFondue;
	import com.gamingfondue.ptb.entities.splash.Menu;
	
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.Tween;
	import net.flashpunk.World;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
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
		 * Elapsed time, used to sync music
		 */ 
		private var elapsed:Number;
		
		/**
		 * Background music
		 */
		private var balrog:Sfx;
		
		/**
		 * Called when the world is activated.
		 * It creates the bounce effect of the title.
		 */ 
		override public function begin():void
		{
			// Intro music
			balrog = new Sfx(Assets.BALROG);
			balrog.loop();
			
            elapsed = 0;
            fp = new FlashPunk(0xFF9900, 0x333333, 1, 2.7);
			gf = new GamingFondue();
			menu = new Menu();

			// Log level
			Log.CustomMetric("Splash");

			add(fp);
            fp.start(fpComplete);
		}

        /**
		 * Stores elapsed time and call super update
		 */ 
		override public function update():void
		{
            super.update();
            elapsed += FP.elapsed;
			if (Input.pressed(Key.M)){
				FP.volume = 1 - FP.volume;
			}
		}
		
        private function fpComplete():void
        {
			add(gf);
			remove(fp);
            gf.start(elapsed, gfComplete);
        }
		
		private function gfComplete():void
		{
			add(menu);
			remove(gf);
			menu.start(menuComplete)
		}
		
		private function menuComplete():void
		{
			balrog.stop();
			Statistics.begin = getTimer();
			FP.world = new Reality();
		}
		
		override public function end():void
		{
			clearTweens()
			removeAll();
		}
	}
}
