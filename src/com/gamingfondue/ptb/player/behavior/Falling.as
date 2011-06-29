package com.gamingfondue.ptb.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Falling extends Behavior
	{
		override public function begin():void
		{
			player.acceleration.y = GRAVITY;
			player.speed.y = 0;
			player.image.angle = 0;
		}
		
		override public function update():void
		{
			fall(GRAVITY);
			
			// Project player horizontally
			if(Input.check(Bindings.RIGHT_KEY)) {
				player.acceleration.x = RUN_ACCEL * 0.5;
				
			} else if (Input.check(Bindings.LEFT_KEY)){
				player.acceleration.x = -RUN_ACCEL * 0.5;
				
			} else {
				player.acceleration.x = 0;
				player.speed.x *= FRICTION;
			}
			
			player.speed.x += player.acceleration.x * FP.elapsed;
			if (player.speed.x > RUN_SPEED) player.speed.x = RUN_SPEED;
			if (player.speed.x < -RUN_SPEED) player.speed.x = -RUN_SPEED;
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				
				// if speed > 0, he's moving right
				if(player.speed.x > 0) {
					
					// If the player lands mid-cell, push him left
					projection.x -= projection.x % CELL_SIZE;
					while(player.collide(Types.SOLID, projection.x, player.y)) {
						projection.x -= CELL_SIZE;
					}
					player.x = projection.x;
					
					// If the player holds right, we start walling
					if(Input.check(Bindings.RIGHT_KEY)) {
						player.behavior = Behaviors.RIGHT_WALLING; return;
					}
					
				// if speed < 0, he's moving left
				} else if(player.speed.x < 0) {
					
					// If the player lands mid-cell, push him right
					projection.x += CELL_SIZE - (projection.x % CELL_SIZE);
					while(player.collide(Types.SOLID, projection.x, player.y)) {
						projection.x += CELL_SIZE;
					}
					player.x = projection.x;
					
					// If the player holds right, we start walling
					if(Input.check(Bindings.LEFT_KEY)) {
						player.behavior = Behaviors.LEFT_WALLING; return;
					}
				}
				player.speed.x = 0;
			}
			player.x = projection.x;
		}
	}
}
