package com.gamingfondue.ptb.entities
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		[Embed(source = '/assets/player.png')]
		private const PLAYER_GRAPHIC:Class;
		private var image:Image;
		
		private var movement:Point;
		private var speed:Point;
		
		public function Player()
		{
			super();
			image = new Image(PLAYER_GRAPHIC);
			graphic = image;
			
			setHitbox(16, 16, 0, 0);
			movement = new Point();
			speed = new Point();
			type = "player";
		}
		
		override public function update():void
		{
			movement.x = 0;
			movement.y = 0;
			
			updateInput();
			updatePhysic();
			updateCollisions();
			updateAnimation();
			
			x += movement.x;
			y += movement.y;
		}
		
		protected function updateInput():void 
		{
			// input
			if (Input.check(Key.LEFT)) speed.x -= 1;
			if (Input.check(Key.RIGHT)) speed.x += 1;
			
			// FIXME: crappy jump
			if (Input.pressed(Key.UP)) movement.y -= 80;
		}
		
		protected function updatePhysic():void 
		{
			// speed limit
			if (speed.x > 5) speed.x = 5;
			if (speed.x < -5) speed.x = -5;
			
			if (speed.y > 20) speed.x = 20;
			if (speed.x < -20) speed.x = -20;
			
			// gravity
			//speed.y += 9.8 * FP.elapsed;
			
			// apply speed
			movement.x = speed.x;
			movement.y = speed.y;
		}
		
		protected function updateCollisions():void 
		{
			if (collide("level", x, y + movement.y)) {
				speed.y = 0;
				movement.y = 0;
			} 
			
			if (collide("level", x + movement.x, y)) {
				speed.x = 0;
				movement.x = 0;	
			}
		}
		
		protected function updateAnimation():void
		{
			if (Input.pressed(Key.LEFT)) image.flipped = true;
			if (Input.pressed(Key.RIGHT)) image.flipped = false;
		}
	}
}