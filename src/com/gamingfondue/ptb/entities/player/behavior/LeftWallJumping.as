package com.gamingfondue.ptb.entities.player.behavior
{
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;

	public class LeftWallJumping extends PlayerBehavior
	{
		override public function begin():void
		{
			player.acceleration.y = WALL_JUMP;
			player.acceleration.x = RUN_ACCEL;
			player.speed.x = WALLJUMP_SPEED;
			player.image.flipped = false;
			player.jump();
		}
		
		override public function update():void
		{
			jump();
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.x -= projection.x % CELL_SIZE;
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, projection.x, player.y)) {
					projection.x -= CELL_SIZE;
				}
				
				// Players stops on wall collision
				player.speed.x = 0;
			}
			player.x = projection.x;
			
			// After we reach the peak, start falling
			if(player.speed.y > FALLING_SPEED) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}