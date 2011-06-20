package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;

	public class Jumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = JUMP_STRENGTH;
		}
		
		override public function update():void
		{
			// TODO: if player releases the jump key before reaching the highest position
			// he starts falling
			
			// TODO: horizontal movement while jumping
			// TODO: horizontal collision 
			
			
			// Apply gravity
			player.acceleration.y += GRAVITY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			player.y += player.speed.y;
			
			if(player.speed.y > 0) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));
			}
		}
	}
}