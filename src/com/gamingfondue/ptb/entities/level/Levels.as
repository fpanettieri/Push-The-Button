package com.gamingfondue.ptb.entities.level
{
	/**
	 * Static class used to embed levels
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Levels
	{
		public static const last:Number = 14;//58;
		
		[Embed(source='/assets/level01.oel', mimeType='application/octet-stream')]
		private static const L1:Class;
		
		[Embed(source='/assets/hp01.oel', mimeType='application/octet-stream')]
		private static const HP1:Class;
		
		private static const REALITIES:Array = [L1];
		private static var realities:Array = [];

		private static const NIRVANAS:Array = [HP1];
		private static var nirvanas:Array = [];

		private static var _current:Number = -1;
		private static var instance:Levels = new Levels();
		
		public function Levels()
		{
			var i:int;
			var reality_parser:LevelParser = new LevelParser();
			for (i = 0; i < REALITIES.length; i++) {
				realities.push(reality_parser.parse(REALITIES[i]));
			}
			
			var nirvana_parser:NirvanaParser = new NirvanaParser();
			for (i = 0; i < NIRVANAS.length; i++) {
				nirvanas.push(nirvana_parser.parse(NIRVANAS[i]));
			}
		}
		
		public static function get number():Number
		{
			return _current + 1;
		}
		
		public static function next():Level
		{
			return realities[++_current];
		}
		
		public static function current():Level
		{
			return realities[_current];
		}
		
		public static function nirvana():Nirvana
		{
			return nirvanas[_current];
		}
	}
}