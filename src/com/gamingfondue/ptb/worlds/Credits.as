package com.gamingfondue.ptb.worlds
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * The last screen of the game. 
	 * It shows my name and contact info. 
	 * Also restart the game if clicked.
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Credits extends World
	{
		/**
		 * Text showing my name
		 */ 
		private var author:Text;
		
		/**
		 * Contact mail
		 */ 
		private var contact:Text;
		
		/**
		 * Restart message
		 */ 
		private var restart:Text;
		
		/**
		 * Called when the world is activated.
		 * It initializes texts and places them on screen.
		 */ 
		override public function begin():void
		{
			author = new Text("author: Fabio R. Panettieri", 30, 20, 400, 20);
			author.size = 14;
			
			contact = new Text("contact: fpanettieri@gmail.com", 30, 40, 400, 30 );
			contact.size = 14;
			
			restart = new Text("click to restart", 220, 400, 200, 15);
			
			addGraphic(author);
			addGraphic(contact);
			addGraphic(restart);
		}
		
		/**
		 * Restarts the demo on mouse click.
		 */ 
		override public function update():void
		{
			if (Input.mousePressed) {
				FP.world = new Splash();
			}
		}
	}
}