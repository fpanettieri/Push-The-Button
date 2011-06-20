package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Standing extends Behavior
	{
		override public function change():void
		{
			player.double_jump = false;
		}
		
		override public function update():void
		{
			projection.y = player.y + 1;
			
			// FIXME: Remove falling condition on release. We can't fall while standing
			// If there it's no solid under us, we're falling
			if(!player.collide(Types.SOLID, player.x, projection.y)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));	
			}
			
			// SMB jump key ;)
			if(Input.check(Bindings.JUMP_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.JUMPING));
			}
			
			// Start running right
			if(Input.check(Bindings.RIGHT_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.RIGHT_RUNNING));
			}
			
			// Start running left
			if(Input.check(Bindings.LEFT_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.LEFT_RUNNING));
			}
		}
	}
}