package com.gamingfondue.ptb.player.behaviour
{
	import com.gamingfondue.ptb.player.Player;
	
	import flash.events.EventDispatcher;
	import flash.geom.Point;
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
		public var player:Player;
		
		protected const MAX_SPEED:Number = 8;
		
		// Vector used to estamiate player location after physics calculations
		protected var projection:Point;
		
		// Smallest distance required to move the player out of collision
		protected var displacement:Point;
		
		// Called when the behavior has changed
		public function change():void {}
		
		// updates player state
		public function update():void {}

		public function Behavior()
		{
			projection = new Point();
			displacement = new Point();
		}
	}
}