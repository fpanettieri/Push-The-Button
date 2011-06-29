package com.gamingfondue.ptb.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.utils.Input;

	public class RightSliding extends Behavior
	{
		override public function begin():void
		{
			player.image.flipped = false;
			player.image.angle = 0;
		}
		
		override public function update():void
		{
			// Horizontal movement
			player.acceleration.x = 0;
			player.speed.x *= FRICTION;
			if (player.speed.x < MIN_SPEED) player.speed.x = 0;

			// Project the player horizontally
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				projection.x -= projection.x % CELL_SIZE;
				player.x = projection.x;
				player.behavior = Behaviors.STANDING; return;
			} else {
				player.x = projection.x;
			}

			// If there it's no solid under us, we're falling
			if(!player.collide(Types.SOLID, player.x, player.y + 1)) {
				player.behavior =  Behaviors.FALLING; return;
			}

			// If we're not falling we continue running
			if (Input.check(Bindings.RIGHT_KEY)) {
				player.behavior =  Behaviors.RIGHT_RUNNING; return;
			}

			// in either direction
			if (Input.check(Bindings.LEFT_KEY)) {
				player.behavior =  Behaviors.STANDING; return;
			}

			// else, if the speed == 0, then we're actually standing
			if (player.speed.x == 0) {
				player.behavior = Behaviors.STANDING; return;
			}
		}
	}
}
