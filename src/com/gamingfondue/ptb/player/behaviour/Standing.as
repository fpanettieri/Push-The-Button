package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	
	import net.flashpunk.FP;

	public class Standing extends Behavior
	{
		override public function update():void
		{
			// If there it's no solid under us, we're falling
			if(!player.collide(Types.SOLID, player.x, player.y + 1)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));	
			}
		}
	}
}