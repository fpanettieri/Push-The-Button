package com.gamingfondue.util
{
	import flash.external.ExternalInterface;

	public class Logger
	{
		public static function log(msg:Object):void
		{
			//ExternalInterface.call("GF.log", msg.toString());
		}
	}
}