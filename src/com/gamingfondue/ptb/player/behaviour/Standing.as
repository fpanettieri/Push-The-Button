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
			player.acceleration.x = 0;
			player.acceleration.y = 0;
			player.speed.x = 0;
			player.speed.y = 0;
		}
		
		override public function update():void
		{
			// SMB jump key :D
			if(Input.pressed(Bindings.JUMP_KEY)) {
				player.behavior = Behaviors.JUMPING; return;
			}
			
			// If there it's no solid under us, we're falling
			projection.y = player.y + 1;
			if(!player.collide(Types.SOLID, player.x, projection.y)) {
				player.behavior = Behaviors.FALLING; return;
			}
			
			// Start running right
			if(Input.check(Bindings.RIGHT_KEY)) {
				player.behavior = Behaviors.RIGHT_RUNNING; return;
			}
			
			// Start running left
			if(Input.check(Bindings.LEFT_KEY)) {
				player.behavior = Behaviors.LEFT_RUNNING; return;
			}
		}
	}
}
