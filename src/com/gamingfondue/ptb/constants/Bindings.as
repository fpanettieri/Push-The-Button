package com.gamingfondue.ptb.constants
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	/**
	 * Key bindings. Used to configure behavior through the complete game
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Bindings
	{
		public static const JUMP_KEY:String = "jump";
		Input.define(JUMP_KEY, Key.SPACE, Key.UP, Key.W, Key.Z, Key.X);

		public static const RIGHT_KEY:String = "right";
		Input.define(RIGHT_KEY, Key.RIGHT, Key.D);
		
		public static const LEFT_KEY:String = "left";
		Input.define(LEFT_KEY, Key.LEFT, Key.A);
		
		public static const DOWN_KEY:String = "down";
		Input.define(DOWN_KEY, Key.DOWN, Key.S);
		
		public static const ACCEPT_KEY:String = "accept";
		Input.define(ACCEPT_KEY, Key.ENTER, Key.SPACE);
	}
}
