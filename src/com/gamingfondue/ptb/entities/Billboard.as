package com.gamingfondue.ptb.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;

	/**
	 * Billboard listen to message events and display them scrolling
	 * in the bottom of the screen.
	 * 
	 * It has a limited size of queued events that are displayed
	 * It communitactes with a centrilazed messaging system that dispatch
	 * game-wide messages.
	 */ 
	public class Billboard extends Entity
	{
		/**
		 * Max number of queued messages
		 */ 
		private static const QUEUE_SIZE:int = 5;
		
		/**
		 * Message speed
		 */ 
		private static const SPEED:int = 7;
		
		/**
		 * Displayed text
		 */ 
		private var text:Text;
		
		/**
		 * Marquee effect.
		 */ 
		private var scroll:VarTween;
		
		/**
		 * Fixed size message queue
		 */ 
		public static var queue:Array;
		
		/**
		 * Called when the billboard is added to a World.
		 */
		public function Billboard()
		{
			visible = false;
			queue = [];
			text = new Text("",0, 300, 480, 32);
			text.scrollX = 0;
			text.scrollY = 0;
			graphic = text;
			scroll = new VarTween(onScroll);
			addTween(scroll);
		}

		/**
		 * Check the billboard state, and determines if it should display a new
		 * message.
		 */ 
		override public function update():void
		{
			if (!visible && queue.length > 0) {
				visible = true;
				text.text = queue.pop();
				x = FP.screen.width;
				scroll.tween(this, 'x', -text.width, SPEED);
				scroll.start();
			}
		}
		
		/**
		 * Adds a message to the message queue.
		 */ 
		public static function notify(msg:String):void
		{
			if (queue.length == QUEUE_SIZE) {
				queue.pop();
			}
			queue.push(msg);
		}
		
		/**
		 * Tween callback.
		 */
		private function onScroll():void
		{
			visible = false;
		}
	}
}