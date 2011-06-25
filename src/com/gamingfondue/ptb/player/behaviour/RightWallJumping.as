package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;

	public class RightWallJumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = WALL_JUMP;
			player.acceleration.x = -RUN_ACCEL;
			player.speed.x = -WALLJUMP_SPEED;
		}
		
		override public function update():void
		{
			// Project player vertically
			player.acceleration.y += GRAVITY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(player.speed.y < 0 && player.collide(Types.SOLID, player.x, projection.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.y += CELL_SIZE - (projection.y % CELL_SIZE);
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, player.x, projection.y)) {
					projection.y += CELL_SIZE;
				}
			}
			player.y = projection.y;
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.x += CELL_SIZE - (projection.x % CELL_SIZE);
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, projection.x, player.y)) {
					projection.x += CELL_SIZE;
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