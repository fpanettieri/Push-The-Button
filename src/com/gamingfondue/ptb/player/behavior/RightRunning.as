package com.gamingfondue.ptb.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class RightRunning extends Behavior
	{
		override public function begin():void
		{
			player.image.flipped = false;
		}
		
		override public function update():void
		{
			// Horizontal movement
			player.acceleration.x = RUN_ACCEL;
			player.speed.x += player.acceleration.x * FP.elapsed;
			if (player.speed.x > RUN_SPEED) player.speed.x = RUN_SPEED;
			
			// Project the player horizontally
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				projection.x -= projection.x % CELL_SIZE;
				player.x = projection.x;
				player.behavior = Behaviors.STANDING; return;
			} else {
				player.x = projection.x;
			}

			// Jumping it's our first priority
			if (Input.pressed(Bindings.JUMP_KEY)) {
				player.behavior = Behaviors.RIGHT_JUMPING; return;
			}
			
			// Then we check if we should fall
			if(!player.collide(Types.SOLID, player.x, player.y + 1)) {
				player.behavior = Behaviors.FALLING; return;
			}
			
			// Else we continue running or start to slide
			if (!Input.check(Bindings.RIGHT_KEY)) {
				player.behavior = Behaviors.RIGHT_SLIDING; return;
			}
		}
	}
}
