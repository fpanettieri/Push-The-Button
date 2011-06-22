package com.gamingfondue.ptb.player
{
	import com.gamingfondue.ptb.Assets;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.player.behaviour.Behavior;
	import com.gamingfondue.ptb.player.behaviour.BehaviorFactory;
	import com.gamingfondue.ptb.player.behaviour.Behaviors;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Player extends Entity
	{
		private var image:Image;
		private var _behavior:Behavior;
		
		public var double_jump:Boolean;
		public var acceleration:Point;
		public var speed:Point;
		
		public function Player()
		{
			super(20, 50);
			image = new Image(Assets.PLAYER);
			graphic = image;
			
			setHitbox(16, 16, 0, 0);
			type = Types.PLAYER;
			
			acceleration = new Point();
			speed = new Point();
			behavior = Behaviors.STANDING;
		}
		
		/**
		 * Attemps to update player behavior
		 * Then update player state
		 */
		override public function update():void
		{
			_behavior.update();
		}
		
		/**
		 * Syntax sugar. Updates the player behavior
		 */
		public function set behavior(behavior:int):void
		{
			_behavior = BehaviorFactory.get(behavior);
			_behavior.player = this;
			_behavior.change();
			
			// TODO: Remove this before release
			Logger.log("Estado: " + _behavior.toString());
		}
		
	}
}
