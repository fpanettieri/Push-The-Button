package com.gamingfondue.ptb.player.behaviour
{
	public class BehaviorFactory
	{
		/**
		 * Pregenerated behaviors array
		 */ 
		private static const behaviors:Array = [
			new Standing(),
			new RunningLeft(),
			new RunningRight(),
			new Jumping(),
			new DoubleJumping(),
			new WallingLeft(),
			new WallingRight(),
			new Falling(),
			new Dead()
		];
		
		public static function get(type:int):Behavior
		{
			return behaviors[type];
		}
	}
}