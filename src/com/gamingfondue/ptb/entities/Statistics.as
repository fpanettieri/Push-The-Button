package com.gamingfondue.ptb.entities
{
	/**
	 * Stores global statistics about the player
	 */ 
	public class Statistics
	{
		public static var language:int = 0;
		public static var age:Number = 0;
		public static var money:Number = 0;
		public static var happiness:Number = 0;
		public static var begin:int = 0;
		public static var end:int = 0;
		
		public static function reset():void
		{
			age = 0;
			money = 0;
			happiness = 0;
			begin = 0;
			end = 0;
		}
	}
}