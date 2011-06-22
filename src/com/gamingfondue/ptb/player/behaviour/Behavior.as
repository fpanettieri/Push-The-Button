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
		
		// Default player configuration
		protected var CELL_SIZE:Number = 8;
		protected var MAX_SPEED:Number = 8;
		protected var MIN_SPEED:Number = 0.2;
		protected var GRAVITY:Number = 8;
		protected var FRICTION:Number = 0.8;
		protected var RUN_ACCEL:Number = 8;
		protected var RUN_SPEED:Number = 4;


		// Jump heights
		protected var HIGH_JUMP:Number = -140;
		protected var DOUBLE_JUMP:Number = -60;
		protected var LONG_JUMP:Number = -80;
		protected var WALL_JUMP:Number = -100;
	
		// Vector used to estamiate player location after physics calculations
		protected var projection:Point;
		
		// Called when the behavior has changed
		public function change():void {}
		
		// updates player state
		public function update():void {}
		
		public function Behavior()
		{
			projection = new Point();
		}
	}
}
