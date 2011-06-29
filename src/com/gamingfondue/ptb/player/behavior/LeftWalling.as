package com.gamingfondue.ptb.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class LeftWalling extends Behavior
	{
		override public function begin():void
		{
			player.acceleration.y = 0;
			player.acceleration.x = 0;
			player.speed.x = 0;
			
			player.image.flipped = true;
			player.image.angle = -90;
			player.image.x = 16;
		}
		
		override public function end():void
		{
			player.image.x = 0;
		}
		
		override public function update():void
		{
			fall(GRAVITY * 0.5);
			
			// If the player releases the key, he start falling again
			if (Input.pressed(Bindings.JUMP_KEY)) {
				player.behavior = Behaviors.LEFT_WALL_JUMPING; return;
			}
			
			// If the player releases the key, he start falling again
			if (!Input.check(Bindings.LEFT_KEY) || !player.collide(Types.SOLID, player.x - 1, player.y)) {
				player.behavior = Behaviors.FALLING; return;
			}
		}
	}
}