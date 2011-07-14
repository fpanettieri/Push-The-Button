package com.gamingfondue.ptb.constants
{
	/**
	 * Static class used to embed binary files
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Assets
	{
		/**
		 * Player avatar
		 */ 
		[Embed(source='/assets/player.png')]
		public static const PLAYER:Class;
		
		/**
		 * Walls sprite
		 */ 
		[Embed(source='/assets/wall.png')]
		public static const WALL:Class;
		
		/**
		 * TV image
		 */ 
		[Embed(source = "/assets/tv.png")]
		public static const TV_IMAGE:Class;
		
		/**
		 * Button image
		 */ 
		[Embed(source = "/assets/button.png")]
		public static const BUTTON:Class;
		
		/**
		 * Work background music
		 */ 
		[Embed(source = "/assets/sounds.swf#sonata")]
		public static const SONATA:Class;
		
		/**
		 * TV sound track
		 */ 
		[Embed(source = "/assets/sounds.swf#tv")]
		public static const TV_NOISE:Class;
		
		/**
		 * Jumping sound effect
		 */ 
		[Embed(source = "/assets/sounds.swf#jumping")]
		public static const JUMPING:Class;
		
		/**
		 * Money sound effect
		 */ 
		[Embed(source = "/assets/sounds.swf#money")]
		public static const MONEY:Class;

		/**
		 * FlashPunk splash assets
		 */
		[Embed(source = "/assets/splash_lines.png")] public static const SPLASH_LINES:Class;
		[Embed(source = "/assets/splash_cog.png")] public static const SPLASH_COG:Class;
		[Embed(source = "/assets/splash_left.png")] public static const SPLASH_LEFT:Class;
		[Embed(source = "/assets/splash_right.png")] public static const SPLASH_RIGHT:Class;
		
		/**
		 * Gaming Fonduie splash assets
		 */
		[Embed(source = "/assets/splash.png")] public static const SPLASH:Class;
	}
}
