package com.gamingfondue.ptb.entities
{
	import net.flashpunk.Entity;
	
	/**
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Light extends Entity
	{
		
		private var on:Boolean;
		
		/**
		 * Title constructor.
		 */ 
		public function Light()
		{
			super(0, 0);
		}

		/**
		 * Power on  the light
		 */
		public function turnOn():void
		{
			on = true;
		}

		/**
		 * Power off  the light
		 */
		public function turnOff():void
		{
			on = false;
		}
	}
}
