package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Title;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * The first screen of the game. It shows the game name a couple of seconds
	 * then it creates the GameWorld.
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class SplashWorld extends World
	{
		/**
		 * Game title.
		 */ 
		private var title:Title;
		
		/**
		 * Bounces the title in screen.
		 */ 
		private var fadeIn:VarTween;
		
		/**
		 * Timer used to delay the fadeOut effect.
		 */ 
		private var timer:Timer;
		
		/**
		 * Bounches the title out of the screen.
		 */ 
		private var fadeOut:VarTween;

		/**
		 * Game world instance. Created while the animations are being played
		 */
		private var game:World;
		
		/**
		 * SplashWorld constructor. 
		 * Creates the title.
		 */ 
		public function SplashWorld()
		{
			title = new Title();
		}
		
		/**
		 * Called when the world is activated.
		 * It creates the bounce effect of the title.
		 */ 
		override public function begin():void
		{
			add(title);
			fadeIn = new VarTween(onFadeIn);
			fadeIn.tween(title, "y", 120, 2.2, Ease.bounceOut);
			addTween(fadeIn, true);
		}
		
		/**
		 * Callback of the fadeIn effect. 
		 * It starts the timer to delay title fadeOut effect.
		 */ 
		private function onFadeIn(event:Event=null):void
		{
			game = new GameWorld();
			timer = new Timer(4000, 1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		/**
		 * Timer callback. 
		 * Starts the fadeOut effect.
		 */ 
		private function onTimer(event:Event=null):void
		{
			fadeOut = new VarTween(onFadeOut);
			fadeOut.tween(title, "y", -300, 2.2, Ease.bounceIn);
			addTween(fadeOut, true);
		}
		
		/**
		 * FadeOut callback. 
		 * Activates the game world.
		 */ 
		private function onFadeOut(event:Event=null):void
		{
			FP.world = game;
			game = null;
		}
	}
}
