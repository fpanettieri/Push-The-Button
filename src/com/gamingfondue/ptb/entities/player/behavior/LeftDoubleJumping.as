package com.gamingfondue.ptb.entities.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class LeftDoubleJumping extends PlayerBehavior
	{
		override public function begin():void
		{
			player.acceleration.y = DOUBLE_JUMP;
			player.image.flipped = true;
			player.jump();
		}
		
		override public function update():void
		{
			// Project player vertically
			player.acceleration.y += GRAVITY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			
			jump();
			
			// Project player horizontally
			player.acceleration.x = -RUN_ACCEL;
			
			// Accelerate while player presses right
			if(Input.check(Bindings.LEFT_KEY)) {
				player.speed.x += player.acceleration.x * FP.elapsed;
			} else {
				player.speed.x *= FRICTION;
			}
			if (player.speed.x < -RUN_SPEED) player.speed.x = -RUN_SPEED;
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.x += CELL_SIZE - (projection.x % CELL_SIZE);
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, projection.x, player.y)) {
					projection.x += CELL_SIZE;
				}
				
				// Players stops on wall collision
				player.speed.x = 0;
			}
			player.x = projection.x;
			
			// After we reach the peak, start falling
			if(player.speed.y > FALLING_SPEED) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}