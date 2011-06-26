package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class DoubleJumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = DOUBLE_JUMP;
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
			
			// After we reach the peak, start falling
			if(player.speed.y > FALLING_SPEED) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}