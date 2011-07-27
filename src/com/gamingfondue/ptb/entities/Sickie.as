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
		private const THRESHOLD:Number = 30 * 1000;
		
		/**
		 * Injected dependency
		 */ 
		public var player:Player;
		
		private var worked:Number;
		private var displayed:Boolean;
		
		public function Sickie(x:Number, y:Number)
		{
			super(x, y);
			worked = 0;
			displayed = false;
		}
		
		override public function update():void
		{
			if(player && !displayed && player.working && player.lastButton + THRESHOLD < getTimer()) {
				displayed = true;
				Billboard.notify(Tooltip.sickie);
			}
			
			if (player && player.working && displayed && Input.pressed(Bindings.SICKIE_KEY)) {
				Statistics.sickies++;
				player.x = x;
				player.y = y;
				world.remove(this);
			}
		}
	}
}