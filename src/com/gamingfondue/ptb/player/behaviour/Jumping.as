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
		private const JUMP_STRENGTH:Number = -140;
		private const JUMP_DECAY:Number = 8;
		
		private const GRAVITY:Number = 76;
		private var strength:Number;
		
		override public function change():void
		{
			player.acceleration.y = JUMP_STRENGTH;
		}
		
		override public function update():void
		{
			// Apply gravity
			player.acceleration.y += JUMP_DECAY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			player.y += player.speed.y;
			
			if(player.speed.y > 0) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));
			}
		}
	}
}