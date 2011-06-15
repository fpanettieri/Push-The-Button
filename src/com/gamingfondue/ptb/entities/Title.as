package com.gamingfondue.ptb.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * Game name.
	 * Used in splash screen.
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Title extends Entity
	{
		
		private var text:Text;
		
		/**
		 * Title constructor.
		 */ 
		public function Title()
		{
			super(80, 0);
			text = new Text("Push the button");
			graphic = text;
		}
	}
}