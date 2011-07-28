package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Bindings;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.utils.getTimer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	public class Sickie extends Entity
	{
		private const THRESHOLD:Number = 13 * 1000;
		
		/**
		 * Injected dependency
		 */ 
		public var player:Player;
		
		private var worked:Number;
		
		public function Sickie(x:Number, y:Number)
		{
			super(x, y);
			worked = 0;
		}
		
		override public function update():void
		{
			if(player && player.working && player.lastButton + THRESHOLD < getTimer()) {
				player.lastButton = getTimer();
				Billboard.notify(Tooltip.sickie);
			}
			
			if (player && player.working && Input.pressed(Bindings.SICKIE_KEY)) {
				Statistics.sickies++;
				player.x = x;
				player.y = y;
				world.remove(this);
			}
		}
	}
}