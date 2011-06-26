package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class RightWalling extends Behavior
	{
		override public function change():void
		{
			player.acceleration.y = 0;
			player.acceleration.x = 0;
			player.speed.x = 0;
		}
		
		override public function update():void
		{
			fall(GRAVITY * 0.5);
			
			// If the player releases the key, he start falling again
			if (Input.pressed(Bindings.JUMP_KEY)) {
				player.behavior = Behaviors.RIGHT_WALL_JUMPING; return;
			}
			
			// If the player releases the key, he start falling again
			if (!Input.check(Bindings.RIGHT_KEY) || !player.collide(Types.SOLID, player.x + 1, player.y)) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}