package com.gamingfondue.ptb.events
{
	import flash.events.Event;
	
	/**
	 * Event dispatched when a behavior it's done, and request a change
	 * 
	 * @author Fabio R. Panettieri
	 */ 
	public class BehaviorEvent extends Event
	{
		public static const CHANGE_BEHAVIOR:String = "change_behavior";
		
		public var behavior:int;
		public function BehaviorEvent(type:String, behavior:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.behavior = behavior;
		}
	}
}