package com.gamingfondue.ptb.entities
{
	
	import com.gamingfondue.util.Size;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * This entity controls the camera, it tries to keep the player on screen
	 */ 
	public class Cameraman extends Entity
	{
		/**
		 * Cameraman max speed. 
		 * Number of pixels the cameraman can move per second.
		 */ 
		private const SPEED:Number = 2;
		
		/**
		 * Area where the camera can focus properly in pixels.
		 */ 
		private const FOCUS:Number = 32;
		
		/**
		 * The position of the interesting object, in this case the player.
		 */ 
		private var _target:Entity;
		
		/**
		 * Distance of the target to the cameraman.
		 */ 
		private var distance:Point;
		
		/**
		 * Distance of the target to the center of the screen
		 */
		private var radial_distance:Number;
		
		/**
		 * Camera focus center.
		 */ 
		private var center:Point;
		
		/**
		 * Area where the cameraman can move.
		 */
		public var bounds:Rectangle;
		
		/**
		 * Region of the screen used to display a portion of the total image to be shown.
		 */
		private var viewport:Size;
		
		/**
		 * Called when the cameraman is added to a World.
		 */
		public function Cameraman()
		{
			visible = false;
			center = new Point(FP.screen.width / 2, FP.screen.height / 2);
			viewport = new Size(FP.screen.width, FP.screen.height);
			distance = new Point();
			radial_distance = 0;
		}
		
		/**
		 * Update cameraman position
		 */
		override public function update():void
		{
			if (!_target) return;
			
			// Calculate distance to target
			distance.x = _target.x - x;
			distance.y = _target.y - y;
			radial_distance = Math.sqrt(Math.pow(distance.x, 2) + Math.pow(distance.y, 2));
			
			// Move cameraman
			if (radial_distance > FOCUS) {
				x += distance.x / FOCUS * SPEED;
				y += distance.y / FOCUS * SPEED;
			}
			
			// Adjust viewport to bounds
			if (x - center.x < bounds.left) x = bounds.left + center.x;
			if (y - center.y < bounds.top) y = bounds.top + center.y;
			if (x - center.x + viewport.width > bounds.right) x = bounds.right - viewport.width + center.x;
			if (y - center.y + viewport.height > bounds.bottom) y = bounds.bottom - viewport.height + center.y;
			
			// Move camera: In order to center the target, we move the camera AWAY from it
			// thus we need to substract the center position
			FP.world.camera.x = x - center.x;
			FP.world.camera.y = y - center.y;
		}
		
		/**
		 * Store the target and focus it
		 */
		public function set target(target:Entity):void
		{
			_target = target;
			x = target.x;
			y = target.y;
		}
	}
}
