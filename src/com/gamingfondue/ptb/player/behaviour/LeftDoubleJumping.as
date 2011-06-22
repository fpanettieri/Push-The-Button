package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;

	public class LeftDoubleJumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = DOUBLE_JUMP;
		}
		
		override public function update():void
		{
			// Project player vertically
			player.acceleration.y += GRAVITY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(player.collide(Types.SOLID, player.x, projection.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.y += CELL_SIZE - (projection.y % CELL_SIZE);
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, player.x, projection.y)) {
					projection.y += CELL_SIZE;
				}
			}
			player.y = projection.y;
			
			// TODO: horizontal movement while jumping
			// TODO: horizontal collision 
			
			// After we reach the peak, start falling
			if(player.speed.y > 0) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}