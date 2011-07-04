package com.gamingfondue.core
{
	import net.flashpunk.Sfx;
	
	/**
	 * This class is used to represent a sfx with limited volume
	 */ 
	public class LimitedSfx extends Sfx
	{
		public var max:Number = 1;
		public var min:Number = 0;
		
		public function LimitedSfx(source:Class, complete:Function = null) 
		{
			super(source, complete);
		}
		
		override public function set volume(value:Number):void
		{
			if (value < min) value = min;
			if (value > max) value = max;
			super.volume = value;
		}
	}
}