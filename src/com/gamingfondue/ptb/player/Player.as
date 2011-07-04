package com.gamingfondue.ptb.player
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.player.behavior.Behavior;
	import com.gamingfondue.ptb.player.behavior.BehaviorFactory;
	import com.gamingfondue.ptb.player.behavior.Behaviors;
	import com.gamingfondue.ptb.player.sound.Sound;
	import com.gamingfondue.util.Logger;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Player extends Entity
	{
		private var _image:Image;
		private var _behavior:Behavior;
		private var _behaviorType:int;
		private var _sound:Sound;
		
		public var acceleration:Point;
		public var speed:Point;
		
		public function Player()
		{
			super(40, 400);
			_image = new Image(Assets.PLAYER);
			graphic = _image;
			
			_sound = new Sound();
			
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
			
			// TODO: Remove this frmo release
			if (Input.mousePressed) {
				x = Input.mouseX + FP.camera.x;
				y = Input.mouseY + FP.camera.y;
			}
		}
		
		/**
		 * Play a sound effect
		 */ 
		public function play(sound:int):void
		{
			_sound.play(sound);
		}
		
		/**
		 * Syntax sugar. Updates the player behavior
		 */
		public function set behavior(behavior:int):void
		{
			_behaviorType = behavior;
			if(_behavior) _behavior.end();
			_behavior = BehaviorFactory.get(behavior);
			_behavior.player = this;
			_behavior.begin();
		}
		
		/**
		 * Syntax sugar. Updates the player behavior
		 */
		public function get behavior():int
		{
			return _behaviorType;
		}
		
		/**
		 * Read only. Player image
		 */
		public function get image():Image
		{
			return _image;
		}
	}
}
