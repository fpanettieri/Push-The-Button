package com.gamingfondue.ptb.entities.level
{
	/**
	 * Static class used to embed levels
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Levels
	{
		public static const first:Number = -1;//58;
		public static const last:Number = 4;//58;
		
		[Embed(source='/assets/level01.oel', mimeType='application/octet-stream')] private static const L1:Class;
		[Embed(source='/assets/level02.oel', mimeType='application/octet-stream')] private static const L2:Class;
		[Embed(source='/assets/level03.oel', mimeType='application/octet-stream')] private static const L3:Class;
		
		[Embed(source='/assets/hp01.oel', mimeType='application/octet-stream')] private static const HP1:Class;
		[Embed(source='/assets/hp02.oel', mimeType='application/octet-stream')] private static const HP2:Class;
		[Embed(source='/assets/hp03.oel', mimeType='application/octet-stream')] private static const HP3:Class;
		[Embed(source='/assets/hp04.oel', mimeType='application/octet-stream')] private static const HP4:Class;
		[Embed(source='/assets/hp05.oel', mimeType='application/octet-stream')] private static const HP5:Class;
		
		private static const REALITIES:Array = [L1, L2, L3];
		private static var realities:Array = [];

		private static const NIRVANAS:Array = [HP1, HP2, HP3, HP4, HP5];
		private static var nirvanas:Array = [];

		// FIXME: Default should be -1
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
		
		public static function reset():Number
		{
			return _current = first;
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