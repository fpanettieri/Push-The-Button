package com.gamingfondue.ptb.worlds
{
	import net.flashpunk.World;
	
	/**
	 * Animated transition between worlds
	 */ 
	public class Transition extends World
	{
		// Next world 
		private var world:World;
		
		public function Transition(world:World)
		{
			super();
		}
	}
}