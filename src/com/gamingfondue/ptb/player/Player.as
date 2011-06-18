package com.gamingfondue.ptb.player
{
	import com.gamingfondue.ptb.Assets;
	import com.gamingfondue.ptb.constants.Types;
	import com.gamingfondue.ptb.events.BehaviorEvent;
	import com.gamingfondue.ptb.player.behaviour.Behavior;
	import com.gamingfondue.ptb.player.behaviour.BehaviorFactory;
	import com.gamingfondue.ptb.player.behaviour.Behaviors;
	import com.gamingfondue.util.Logger;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Player extends Entity
	{
		private var image:Image;
		private var _behavior:Behavior;
		private var state:State;
		
		public function Player()
		{
			super(20, 50);
			image = new Image(Assets.PLAYER);
			graphic = image;
			
			setHitbox(16, 16, 0, 0);
			type = Types.PLAYER;
			
			state = new State();
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
		 * Called when current behavior requests a change.
		 */
		private function onBehaviorChange(event:BehaviorEvent):void
		{
			if (_behavior) _behavior.removeEventListener(BehaviorEvent.CHANGE_BEHAVIOR, onBehaviorChange);
			behavior = event.behavior;
		}
		
		/**
		 * Syntax sugar. Updates the player behavior
		 */
		private function set behavior(behavior:int):void
		{
			_behavior = BehaviorFactory.get(behavior);
			_behavior.state = state;
			_behavior.player = this;
			_behavior.addEventListener(BehaviorEvent.CHANGE_BEHAVIOR, onBehaviorChange);
			
			// TODO: Remove this vefore release
			Logger.log("Comportamiento: " + _behavior.toString());
		}
		
	}
}