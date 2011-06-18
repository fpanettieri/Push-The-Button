package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.player.Player;
	import com.gamingfondue.ptb.player.State;
	
	import flash.events.EventDispatcher;
	import flash.net.getClassByAlias;
	import flash.utils.getQualifiedClassName;

	/**
	 * Player behavior FSM base class
	 * Models how the player interacts with his environment
	 * 
	 * @author Fabio R. Panettieri
	 */
	public class Behavior extends EventDispatcher
	{
		public var state:State;
		public var player:Player;
		
		// updates player state
		public function update():void 
		{
		
		}
	}
}