package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class LeftWalling extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = 0;
			player.acceleration.x = 0;
			player.speed.x = 0;
		}
		
		override public function update():void
		{
			// Apply gravity
			player.acceleration.y = GRAVITY * 0.4;
			player.speed.y += player.acceleration.y * FP.elapsed;
			
			// Normalize fall speed
			if(player.speed.y > MAX_SPEED) player.speed.y = MAX_SPEED;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(player.collide(Types.SOLID, player.x, projection.y)) {
				
				// If the player lands mid-cell, push him above it
				projection.y -= projection.y % CELL_SIZE;
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, player.x, projection.y)) {
					projection.y -= CELL_SIZE;
				}
				
				player.y = projection.y;
				player.behavior = Behaviors.STANDING; return;
			} else {
				player.y = projection.y;
			}
			
			// If the player releases the key, he start falling again
			if (Input.pressed(Bindings.JUMP_KEY)) {
				player.behavior = Behaviors.LEFT_WALL_JUMPING; return;
			}
			
			// If the player releases the key, he start falling again
			if (!Input.check(Bindings.LEFT_KEY)) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}