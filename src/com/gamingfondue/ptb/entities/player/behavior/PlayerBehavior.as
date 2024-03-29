package com.gamingfondue.ptb.entities.player.behavior
{
	import com.gamingfondue.patterns.Behavior;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;

	/**
	 * Player behavior FSM base class
	 * Models how the player interacts with his environment
	 * 
	 * @author Fabio R. Panettieri
	 */
	public class PlayerBehavior extends Behavior
	{
		public var player:Player;
		
		// Default player configuration
		protected var CELL_SIZE:Number = 8;
		protected var MID_CELL:Number = 4;
		protected var MAX_SPEED:Number = 8;
		protected var MIN_SPEED:Number = 0.2;
		protected var GRAVITY:Number = 8;
		protected var FRICTION:Number = 0.7;
		protected var RUN_ACCEL:Number = 8;
		protected var RUN_SPEED:Number = 4;
		protected var FALLING_SPEED:Number = 0;
		protected var WALLJUMP_SPEED:Number = 4;


		// Jump heights
		protected var HIGH_JUMP:Number = -176;
		protected var DOUBLE_JUMP:Number = -128;
		protected var LONG_JUMP:Number = -144;
		protected var WALL_JUMP:Number = -144;
	
		// Vector used to estamiate player location after physics calculations
		protected var projection:Point;
		
		public function PlayerBehavior()
		{
			projection = new Point();
		}
		
		// project the player vertically and detect collitions
		protected function jump():void
		{
			// Project player vertically
			player.acceleration.y += GRAVITY;
			player.speed.y = player.acceleration.y * FP.elapsed;
			
			// Normalize fall speed
			//if(player.speed.y < -MAX_SPEED) player.speed.y = -MAX_SPEED;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(player.speed.y < 0 && player.collide(Types.SOLID, player.x, projection.y)) {
				
				// If the player lands mid-cell, push him below it
				projection.y += CELL_SIZE - (projection.y % CELL_SIZE);
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, player.x, projection.y)) {
					projection.y += CELL_SIZE;
				}
				
				player.behavior = Behaviors.FALLING;
			}
			player.y = projection.y;
		}
		
		protected function fall(gravity:Number):void
		{
			// Apply gravity
			player.acceleration.y = gravity;
			player.speed.y += player.acceleration.y * FP.elapsed;
			
			// Normalize fall speed
			//if(player.speed.y > MAX_SPEED) player.speed.y = MAX_SPEED;
			
			// Vertical collition
			projection.y = player.y + player.speed.y;
			if(player.collide(Types.SOLID, player.x, projection.y)) {
				
				// If the player lands mid-cell, push him above it
				projection.y -= projection.y % CELL_SIZE;
				
				// If the player went through more than one cell, push him further
				while(player.collide(Types.SOLID, player.x, projection.y)) {
					projection.y -= CELL_SIZE;
				}
				
				player.behavior = Behaviors.STANDING;
			}
			player.y = projection.y;
		}
	}
}
