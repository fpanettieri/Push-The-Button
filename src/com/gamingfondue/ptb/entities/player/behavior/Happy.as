package com.gamingfondue.ptb.entities.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.entities.level.Nirvana;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Happy extends PlayerBehavior
	{
		override public function begin():void
		{
			player.acceleration.y = GRAVITY;
			player.speed.y = 0;
		}
		
		override public function update():void
		{
			fall(GRAVITY);
			
			// Project player horizontally
			if(Input.check(Bindings.RIGHT_KEY)) {
				player.acceleration.x = RUN_ACCEL;
				player.image.flipped = false;
				
			} else if (Input.check(Bindings.LEFT_KEY)){
				player.acceleration.x = -RUN_ACCEL;
				player.image.flipped = true;
				
			} else {
				player.acceleration.x = 0;
				player.speed.x *= FRICTION;
			}
			
			player.speed.x += player.acceleration.x * FP.elapsed;
			
			// Normalize player speed
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
					
				// if speed < 0, he's moving left
				} else if(player.speed.x < 0) {
					
					// If the player lands mid-cell, push him right
					projection.x += CELL_SIZE - (projection.x % CELL_SIZE);
					while(player.collide(Types.SOLID, projection.x, player.y)) {
						projection.x += CELL_SIZE;
					}
					player.x = projection.x;
				}
				player.speed.x = 0;
			}
			player.x = projection.x;
			
			// World wrap
			if (player.x > Nirvana.WIDTH) player.x = 0;
			if (player.x < 0) player.x = Nirvana.WIDTH - CELL_SIZE;
			if (player.y > Nirvana.HEIGHT) player.y = 0;
		}
		
		override protected function fall(gravity:Number):void
		{
			// Apply gravity
			player.acceleration.y = gravity;
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
				player.speed.y = 0;
			}
			player.y = projection.y;
		}
	}
}