package com.gamingfondue.ptb.entities.player.behavior
{
	public class BehaviorFactory
	{
		/**
		 * Pregenerated behaviors array
		 */ 
		private static const behaviors:Array = [
			new Standing(),
			new Jumping(),
			new DoubleJumping(),
			new RightRunning(),
			new RightSliding(),
			new RightJumping(),
			new RightDoubleJumping(),
			new RightWalling(),
			new RightWallJumping(),
			new LeftRunning(),
			new LeftSliding(),
			new LeftJumping(),
			new LeftDoubleJumping(),
			new LeftWalling(),
			new LeftWallJumping(),
			new Falling()
		];
		
		public static function get(type:int):PlayerBehavior
		{
			return behaviors[type];
		}
	}
}