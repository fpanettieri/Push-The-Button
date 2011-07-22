package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class PlayerTrail extends Entity
	{
		/**
		 * Trail length 
		 */
		private const TRAIL_SIZE:int = 6;
		
		/**
		 * Last trail id
		 */ 
		private const LAST_TRAIL:int = TRAIL_SIZE - 1;
		
		/**
		 * How many frames should the trail skip between each update
		 */
		private const DELAY:Number = 0;
		
		/**
		 * Trail colors
		 */
		private static const COLORS:Array = [
			0xFFC00000, 0xFF00C000, 0xFF0000C0, 
			0xFF00C0C0, 0xFFC000C0, 0xFFC0C000];

		/**
		 * Stored player, used to updated trails position
		 */ 
		private var _player:Player;
		
		/**
		 * Each player trail
		 */
		private var trails:Array;
		
		/**
		 * Stored display
		 */
		private var display:Graphiclist;
		
		/**
		 * Counter of skipped frames
		 */
		private var skipped:Number;
		
		/**
		 * Rotated trails
		 */
		private var firstTrail:Image;
		private var currentTrail:Image;
		
		/**
		 * Used to iterate through trails
		 */
		private var i:int;
		
		public function PlayerTrail()
		{
			super(0, 0);
			display = new Graphiclist();
			graphic = display;
			skipped = 0;
			layer = Layers.PLAYER;
		}
		
		/**
		 * Creates player trail
		 */ 
		public function set player(player:Player):void
		{
			_player = player;
			
			// Create trail
			trails = new Array(TRAIL_SIZE);
			var step:Image;
			for (var i:int = 0; i < TRAIL_SIZE; i++) {
				step = new Image(Assets.PLAYER);
				step.color = COLORS[i];
				step.relative = false;
				step.x = player.x;
				step.y = player.y;
				trails[i] = step;
				display.add(step);
			}
		}
		
		/**
		 * Move each trail a step back, last comes forward
		 */ 
		override public function update():void
		{
			// Skip some frames
			if (!_player || skipped++ < DELAY) return;
			skipped = 0;

			// Rotate trail
			firstTrail = trails[0];
			for (var i:Number = 0; i < LAST_TRAIL; i++) {
				trails[i] = trails[i + 1];
			}
			trails[LAST_TRAIL] = firstTrail;
			
			currentTrail = trails[LAST_TRAIL];
			currentTrail.x = _player.x;
			currentTrail.y = _player.y;
			currentTrail.flipped = _player.flipped;
		}
	}
}