package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	
	import net.flashpunk.FP;

	public class Falling extends Behavior
	{
		// Asumming a 1.8 tall player
		// represented in 14 pixels
		// Gravity = 9.8
		// Gravity acceleration in pixels = 9.8 * 14 / 1.8 ~= 76
		private const GRAVITY:Number = 76;
		
		override public function update():void
		{
			// If we'll collide, hit the floor
			if(player.collide(Types.SOLID, player.x, player.y + state.speed.y)) {
				player.y += state.speed.y;
				player.y -= player.y % 16;
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.STANDING));
				return;
			}
			state.acceleration.y += GRAVITY * FP.elapsed;
		}
	}
}