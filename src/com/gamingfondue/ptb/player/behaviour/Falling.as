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
			player.acceleration.y = GRAVITY;
			player.speed.y = 0;
		}
		
		override public function update():void
		{
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
			
			// Apply gravity
			player.acceleration.y = GRAVITY;
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
