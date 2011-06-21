package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	
	import net.flashpunk.utils.Input;

	public class LeftSliding extends Behavior
	{
		override public function update():void
		{
			// Apply gravity
			player.speed.x *= FRICTION;
			if (player.speed.x > -MIN_SPEED) {
				player.speed.x = 0;
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.STANDING));
			}
			
			// Slide when player releases right key
			if (Input.check(Bindings.RIGHT_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.STANDING));
			} else if (Input.check(Bindings.LEFT_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.LEFT_RUNNING));
			}
			
			// Move the player
			projection.x = player.x + player.speed.x;
			if(player.collide(Types.SOLID, projection.x, player.y)) {
				displacement.x = CELL_SIZE - (projection.x % CELL_SIZE);
				player.x = projection.x + displacement.x;
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.STANDING));
			} else {
				player.x = projection.x;
			}
			
			// If there it's no solid under us, we're falling
			if(!player.collide(Types.SOLID, player.x, player.y + 1)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));	
			}
		}
	}
}