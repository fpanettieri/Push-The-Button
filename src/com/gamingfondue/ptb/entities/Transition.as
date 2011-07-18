package com.gamingfondue.ptb.entities
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * Creates a smooth transition between 2 worlds
	 * @author Fabio R. Panettieri
	 */ 
	public class Transition extends Entity
	{
		/**
		 * How long does the transition runs for
		 */
		private static const DURATION:Number = 1;
		
		/**
		 * Number of images used in the transition
		 */
		private static const SEGMENTS:Number = 10;
		
		/**
		 * Tween that moves images
		 */ 
		private var tween:NumTween;
		
		/**
		 * Next world
		 */ 
		private var _world:World;
		
		/**
		 * All 
		 */
		private var images:Array;
		
		/**
		 * Image before tween tweened
		 */ 
		private var source:Image;
		
		/**
		 * Display object, contains each screen segment
		 */ 
		private var display:Graphiclist;
		
		/**
		 * Used to iterate through arrays
		 */ 
		private var i:int;
		
		public function Transition(world:World)
		{
			super(0, 0);
			_world = world;
			tween = new NumTween(onTween, Tween.ONESHOT);
			images = [];
			display = new Graphiclist();
			graphic = display;
			
			var src:Image = FP.screen.capture();
			var section_width:Number = src.width / SEGMENTS;
			
			// Create Image sections
			var bmd:BitmapData;
			var dst:Image;
			for (i = 0; i < SEGMENTS; i++) {
				bmd = new BitmapData(section_width, src.height, true, 0);
				bmd.copyPixels(src.source, new Rectangle(section_width * i, 0, section_width, src.height), new Point(0,0));
				dst = new Image(bmd);
				dst.x = section_width * i;
				images.push(dst);
				display.add(images[i]);
			}
		}
		
		override public function added():void
		{
			addTween(tween, true);
			tween.tween(0, 240, DURATION);
		}
		
		override public function update():void
		{
			for (i = 0; i < SEGMENTS; i++) {
				if(i % 2) {
					images[i].y = tween.value;
				} else {
					images[i].y = -tween.value;
				}
			}
		}

		private function onTween():void
		{
			FP.world = _world;
		}
	}
}