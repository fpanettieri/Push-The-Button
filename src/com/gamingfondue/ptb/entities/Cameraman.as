package com.gamingfondue.ptb.entities
{
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * This entity controls the camera, it tries to keep all the sheeps visible
	 */ 
	public class Cameraman extends Entity
	{
		/**
		 * Number of pixels the cameraman can move per second.
		 */ 
		private const SPEED:int = 130;
		
		/**
		 * Area where the camera can focus properly in pixels.
		 */ 
		private const FOCUS:int = 16;
		
		/**
		 * The position of the interesting object, in this case the player.
		 */ 
		public var target:Entity;
		
		/**
		 * Distance of the target to the cameraman.
		 */ 
		private var distance:Point;
		
		/**
		 * Screen center.
		 */ 
		private var offset:Point;

		/**
		 * Called when the cameraman is added to a World.
		 */
		override public function added():void
		{
			distance = new Point();
			offset = new Point(FP.screen.width / -2, FP.screen.height / -2);
			visible = false;
		}
		
		/**
		 * Called when the billboard is added to a World.
		 */
		override public function update():void
		{
			if (!target) return;
			
			// Normalize movement
			distance.x = target.x - x;
			distance.y = target.y - y;
			
			// Move cameraman
			if (distance.x > FOCUS) {
				x += SPEED * FP.elapsed;
			} else if (distance.x < -FOCUS) {
				x -= SPEED * FP.elapsed;
			}
			
			if (distance.y > FOCUS) {
				y += SPEED * FP.elapsed;
			} else if (distance.y < -FOCUS) {
				y -= SPEED * FP.elapsed;
			}
			
			// Move camera
			FP.world.camera.x = int(x + offset.x);
			FP.world.camera.y = int(y + offset.y);
		}
	}
}