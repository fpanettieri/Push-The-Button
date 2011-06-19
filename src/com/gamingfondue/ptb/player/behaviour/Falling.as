package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	
	import net.flashpunk.FP;

	public class Falling extends Behavior
	{
		private const GRAVITY:Number = 8;
		private const CELL_SIZE:Number = 8;
		
		override public function change():void
		{
			player.acceleration.y = 0;
		}
		
		override public function update():void
		{
			// Apply gravity
			player.acceleration.y += GRAVITY;
			player.speed.y += player.acceleration.y * FP.elapsed;
			
			// Normalize speed
			if(player.speed.y > MAX_SPEED) player.speed.y = MAX_SPEED;
			
			// Check collition
			projection.y = player.y + player.speed.y;
			if(player.collide(Types.SOLID, player.x, projection.y)) {
				
				// FIXME: After pushing the player, we should check if it doesnt collide again, where we should move it
				// up again
				displacement.y = projection.y % CELL_SIZE;
				player.y = projection.y - displacement.y;
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.STANDING));
			} else {
				player.y = projection.y;
			}
		}
	}
}