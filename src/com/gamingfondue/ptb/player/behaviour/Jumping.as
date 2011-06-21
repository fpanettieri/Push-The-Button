package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Jumping extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = JUMP_STRENGTH;
		}
		
		override public function update():void
		{
			if (!Input.check(Bindings.JUMP_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));
			}

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