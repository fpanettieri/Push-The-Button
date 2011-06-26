package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Jumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = HIGH_JUMP;
		}
		
		override public function update():void
		{
			jump();
			
			// Project player horizontally
			if(Input.check(Bindings.RIGHT_KEY)) {
				player.acceleration.x = RUN_ACCEL * 0.5;
				player.speed.x += player.acceleration.x * FP.elapsed;
			} else if (Input.check(Bindings.LEFT_KEY)){
				player.acceleration.x = -RUN_ACCEL * 0.5;
				player.speed.x += player.acceleration.x * FP.elapsed;
			} else {
				player.speed.x *= FRICTION;
			}
			if (player.speed.x > RUN_SPEED) player.speed.x = RUN_SPEED;
			if (player.speed.x < -RUN_SPEED) player.speed.x = -RUN_SPEED;
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				
				if(player.speed.x > 0) {
					projection.x -= projection.x % CELL_SIZE;
					while(player.collide(Types.SOLID, projection.x, player.y)) {
						projection.x -= CELL_SIZE;
					} 
				} else if(player.speed.x < 0) {
					projection.x += CELL_SIZE - (projection.x % CELL_SIZE);
					while(player.collide(Types.SOLID, projection.x, player.y)) {
						projection.x += CELL_SIZE;
					}
				}
			}
			player.x = projection.x;

			// Player can double jump after 3/4 part of the jump
			if (player.acceleration.y > 0.75 * HIGH_JUMP) {
				if (Input.pressed(Bindings.JUMP_KEY)) {
					player.behavior = Behaviors.DOUBLE_JUMPING; return;
				}
			} else {
				if (!Input.check(Bindings.JUMP_KEY)) {
					player.behavior = Behaviors.FALLING; return;
				}
			}
			
			// After we reach the peak, start falling
			if(player.speed.y > FALLING_SPEED) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}
