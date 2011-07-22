package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Layers;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.ResizableText;
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
		public static var size:int = 1;
		
		/**
		 * Message speed
		 */ 
		private static const SPEED:int = 2;
		
		/**
		 * Displayed text
		 */ 
		private var text:ResizableText;
		
		/**
		 * Fixed size message queue
		 */ 
		public static var queue:Array;
		
		/**
		 * Called when the billboard is added to a World.
		 */
		public function Billboard(x:Number = 0, y:Number = 0)
		{
			super(x, y);
			visible = false;
			queue = [];
			text = new ResizableText("",0, 0);
			text.scrollX = 0;
			text.scrollY = 0;
			graphic = text;
			layer = Layers.BILLBOARD;
		}

		/**
		 * Check the billboard state, and determines if it should display a new
		 * message.
		 */ 
		override public function update():void
		{
			if (!visible && queue.length > 0) {
				visible = true;
				text.text = queue.splice(0, 1);
				x = FP.screen.width;
			} else {
				x -= SPEED;
				if (x <= -text.textWidth) {
					visible = false;
				}
			}
		}
		
		/**
		 * Adds a message to the message queue.
		 */ 
		public static function notify(msg:String):void
		{
			if (queue.length >= size) {
				queue.pop();
			}
			queue.push(msg);
		}
	}
}