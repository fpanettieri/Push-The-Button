package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.core.LimitedSfx;
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.util.Logger;
	
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	
	/**
	 * This class represents a television
     * it emmits sounds as the player moves closer to them
     * Also it flashes with mutiple colors
	 */ 
	public class Tv extends Entity
	{
		/**
		 * Number of different frames
		 */
		private static const COLORS:Array = [
			0xFFC00000, 0xFF00C000, 0xFF0000C0, 0xFF00C0C0, 
			0xFFC000C0, 0xFFC0C000, 0xFFC0C0C0];

		/**
		 * Range where the television it's audible
		 */
		private static const FRAME_DURATION:Number = 0.3;

		/**
		 * Range where the television it's audible
		 */
		private var radius:Number;
		
		/**
		 * Injected dependency
		 */ 
		public var player:Player;
		
		/**
         * Television base image, no filters applied
		 * Displayed when the TV it's off
         */
		private var tv_off:Image;

		/**
         * Television glowing frames
		 * Generated on initialization
         */
		private var frames:Array;
		
        /**
         * Noise produced by the television
         */
		private var noise:LimitedSfx;

		/**
         * Timer used to track screen transitions
         */
		private var timer:Number;

		/**
		 * Distance to the player
		 */ 
		private var distance:Point;

		/**
         * Calculated radial distance
		 */
		private var radial_distance:Number;

		/**
         * Indicates if the TV its on or off
         */
		private var on:Boolean;

		/**
		 * Creates and configures the sprite and sounds
		 */ 
		public function Tv(x:Number = 0, y:Number = 0, width:Number = 16, height:Number = 16, radius:Number = 128)
		{
			super(x, y);
			this.radius = radius;
			setHitbox(16,14, 0, -2);
			
			noise = new LimitedSfx(Assets.TV_NOISE);
			noise.min = 0.1;
			noise.max = 0.6;

			// Load raw tv image from Assets
			var raw:Stamp = new Stamp(Assets.TV_IMAGE);
			tv_off = new Image(raw.source);
			tv_off.scaleX = width / 16;
			tv_off.scaleY = height / 16;
			graphic = tv_off;
			layer = Layers.OBJECTS;

			// Create colored frames bitmapdatas array
			var src:BitmapData = raw.source;
			var dst:BitmapData;

			frames = new Array(COLORS.length);
			var frame:Image;
			for (var i:int = 0; i < COLORS.length; i++) {
				dst = src.clone();
				dst.floodFill(3,6, COLORS[i]);
				frame = new Image(dst);
				frame.scaleX = width / 16;
				frame.scaleY = height / 16;
				frames[i] = frame;
			}

			// Initialize TV state
			timer = 0;
			distance = new Point(0,0);
			radial_distance = 0;
			on = false;
		}
		
		/**
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			if (!on) return;

			// Screen color
			if(timer > 0) {
				timer -= FP.elapsed;
				
			} else {
				timer = Math.random() * FRAME_DURATION;
				graphic = frames[int(Math.random() * COLORS.length)];
			}

			// Calculate distance to player
			distance.x = player.x - x;
			distance.y = player.y - y;
			radial_distance = Math.sqrt(Math.pow(distance.x, 2) + Math.pow(distance.y, 2));

			// Noise volume decreases with distance
			noise.volume = 1 - (radial_distance / radius);

			// Panning depends on player location
			noise.pan = distance.x / -radius;
		}

		/**
		 * Power on the TV
		 */
		public function turnOn():void
		{
			on = true;
			noise.loop(0, 0, Math.random() * noise.length * 1000);
			timer = 0;
		}

		public function turnOff():void
		{
			on = false;
			noise.stop();
			graphic = tv_off;
		}
	}
}
