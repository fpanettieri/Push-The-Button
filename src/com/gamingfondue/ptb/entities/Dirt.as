package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	import com.gamingfondue.ptb.entities.player.behavior.Behaviors;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Emitter;
	
	/**
	 * This entity controls dirt that comes out when the player moves 
	 */ 
	public class Dirt extends Entity
	{
		/**
		 * Dirt emitter
		 */ 
		private var emitter:Emitter;
		
		/**
		 * The position of the player.
		 */ 
		private var _player:Player;
		
		/**
		 * Dirt color
		 */
		private const COLOR:uint = 0xC0C0C0;
		
		/**
		 * Horizontal offset, used on right walling
		 */
		private const OFFSET_X:Number = 15;
		
		/**
		 * Vertical offset, used on place player dirt
		 */
		private const OFFSET_Y:Number = 14;
		
		/**
		 * Emitter type
		 */
		private const TYPE:String = 'dirt';
		
		
		/**
		 * Number of dirt particles
		 */ 
		private const PARTCILES:int = 20;
		
		/**
		 * How many seconds shoul each emision be delayed
		 */
		private const DELAY:Number = 0.1;
		
		/**
		 * How much time has passed since the last emission
		 */
		private var delay:Number;
		
		/**
		 * Creates and configures the emmiter
		 */ 
		public function Dirt()
		{
			super(0, 0);
			emitter = new Emitter(new BitmapData(1, 1, false, COLOR));
			this.graphic = emitter;
			
			emitter.newType(TYPE, [0]);
			emitter.setAlpha(TYPE, 0.7, 0.2);
			emitter.setMotion(TYPE, 75, 0, 0.1, 30, 20, 0.3);
			
			layer = Layers.PLAYER;
			delay = 0;
		}
		
		/**
		 * Moves the emitter next to the player and emits something if it's accurate
		 */ 
		override public function update():void 
		{
			if (_player.behavior == Behaviors.LEFT_WALLING) {
				y = _player.y + OFFSET_Y;
				x = _player.x + 1;
				emit(x, y);
			} else if (_player.behavior == Behaviors.RIGHT_WALLING) {
				y = _player.y + OFFSET_Y;
				x = _player.x + OFFSET_X;
				emit(x, y);
			} 
		}
		
		private function emit(x:Number, y:Number):void {
			delay += FP.elapsed;
			if (delay > DELAY){
				delay = 0;
				for(var i:int = 0; i < PARTCILES; i++){
					emitter.emit(TYPE, 0, 0);
				}
			}
		}
		
		/**
		 * Store the target and focus it
		 */
		public function set player(player:Player):void
		{
			_player = player;
			x = player.x;
			y = player.y;
		}
		
	}
}
