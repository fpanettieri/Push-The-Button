package com.gamingfondue.ptb.entities.level
{
	/**
	 * Static class used to embed levels
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Levels
	{
		[Embed(source='/assets/tutorial.oel', mimeType='application/octet-stream')]
		public static const TUTORIAL:Class;
		
		[Embed(source='/assets/level01.oel', mimeType='application/octet-stream')]
		private static const L1:Class;
		
		private static const levels:Array = [L1];
		private static var array:Array = [];

		private static var _current:Number = -1;
		private static var instance:Levels = new Levels();
		
		public function Levels()
		{
			var parser:LevelParser = new LevelParser();
			for (var i:int = 0; i < levels.length; i++) {
				array.push(parser.parse(levels[i]));
			}
		}
		
		public static function get number():Number
		{
			return _current;
		}
		
		public static function next():Level
		{
			return array[++_current];
		}
		
		public static function current():Level
		{
			return array[_current];
		}
		
		public static function previous():Level
		{
			return array[--_current];
		}
	}
}