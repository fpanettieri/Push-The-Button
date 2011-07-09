package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.entities.player.Player;
	
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
		
		// DUNNO
		private var timer:Number = 0;
		
		// DUNNO
		private var particle_count:int = 20;
		
		/**
		 * Creates and configures the emmiter
		 */ 
		public function Dirt()
		{
			emitter = new Emitter(new BitmapData(1, 1, false, 0xFF0000));
			this.graphic = emitter;
			
			emitter.newType('explode',[0]);
			emitter.setMotion('explode', 0, 0, 0.2, 360, 20, 1);
		}
		
		/**
		 * Moves the emitter next to the player and emits something if it's accurate
		 */ 
		override public function update():void {
			x = _player.x;
			y = _player.y;
			
			timer += FP.elapsed;
			if( timer > 1 ) {
				timer = 0;
				explode(x, y);
			}
		}
		
		private function explode(x:Number, y:Number):void {
			for(var i:int = 0; i < particle_count; i++){
				emitter.emit('explode',0,0);
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
