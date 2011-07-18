package com.gamingfondue.ptb.worlds
{
	import com.gamingfondue.ptb.entities.Transition;
	
	import net.flashpunk.World;
	
	/**
	 * Animated transition between worlds
	 */ 
	public class WorldTransition extends World
	{
		private var transition:Transition;
		
		public function WorldTransition(world:World)
		{
			super();
			transition = new Transition(world);
		}
		
		override public function begin():void
		{
			add(transition);
		}
	}
}