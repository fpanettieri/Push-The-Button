package com.gamingfondue.patterns
{
	/**
	 * Behavior FSM base class
	 * Models how an entity interacts with his environment
	 * 
	 * @author Fabio R. Panettieri
	 */
	public class Behavior
	{
		// Called after the behavior has been changed
		public function begin():void {}
		
		// updates player state
		public function update():void {}
		
		// Called before changing the behavior
		public function end():void {}
	}
}