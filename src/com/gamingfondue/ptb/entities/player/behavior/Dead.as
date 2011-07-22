package com.gamingfondue.ptb.entities.player.behavior
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.entities.level.Nirvana;
	
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	public class Dead extends PlayerBehavior
	{
		override public function begin():void
		{
			player.acceleration.y = GRAVITY;
			player.speed.y = 0;
		}
		
		override public function update():void
		{
			fall(GRAVITY);
			
			// Project player horizontally
			if(Input.check(Bindings.RIGHT_KEY)) {
				player.acceleration.x = RUN_ACCEL;
				player.image.flipped = false;
				
			} else if (Input.check(Bindings.LEFT_KEY)){
				player.acceleration.x = -RUN_ACCEL;
				player.image.flipped = true;
				
			} else {
				player.acceleration.x = 0;
				player.speed.x *= FRICTION;
			}
			
			player.speed.x += player.acceleration.x * FP.elapsed;
			
			// Normalize player speed
			if (player.speed.x > RUN_SPEED) player.speed.x = RUN_SPEED;
			if (player.speed.x < -RUN_SPEED) player.speed.x = -RUN_SPEED;
			
			// Horizontal collition
			projection.x = player.x + player.speed.x;
			if(projection.x > 1000) {
				projection.x = 1000;
				player.speed.x = 0;
			} else if (projection.x < -1000) {
				projection.x = -1000;
				player.speed.x = 0;
			} 
			player.x = projection.x;
		}
		
		override protected function fall(gravity:Number):void
		{
			// Apply gravity
			player.acceleration.y = gravity;
			player.speed.y += player.acceleration.y * FP.elapsed;
			
			// Normalize fall speed
			if(player.speed.y > MAX_SPEED) player.speed.y = MAX_SPEED;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(projection.y > 186) {
				projection.y = 186;
				player.speed.y = 0;
			}
			player.y = projection.y;
		}
	}
}