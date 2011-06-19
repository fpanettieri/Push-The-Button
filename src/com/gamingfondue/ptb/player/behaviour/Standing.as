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
			
			// If there it's no solid under us, we're falling
			if(!player.collide(Types.SOLID, player.x, projection.y)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.FALLING));	
			}
			
			// SMB jump key ;)
			if(Input.pressed(Bindings.JUMP_KEY)) {
				dispatchEvent(new BehaviorEvent(BehaviorEvent.CHANGE_BEHAVIOR, Behaviors.JUMPING));
			}
		}
	}
}