package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Falling extends Behavior
	{
		override public function change():void
		{
			// FIXME: commented, dunno if it's right
			player.acceleration.y = 0;
		}
		
		override public function update():void
		{
			// Apply gravity
			player.acceleration.y += GRAVITY;
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
		}
	}
}
