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
		 * Happiness image
		 */ 
		[Embed(source = "/assets/happiness.png")]
		public static const HAPPINESS_IMAGE:Class;
		
		/**
		 * Intro music
		 */ 
		[Embed(source = "/assets/sounds.swf#balrog")]
		public static const BALROG:Class;
		
		/**
		 * Work background music
		 */ 
		[Embed(source = "/assets/sounds.swf#sonata_sad")]
		public static const SONATA_SAD:Class;
		
		/**
		 * Happy place music
		 */ 
		[Embed(source = "/assets/sounds.swf#sonata_happy")]
		public static const SONATA_HAPPY:Class;
		
		/**
		 * TV sound track
		 */ 
		[Embed(source = "/assets/sounds.swf#tv")]
		public static const TV_SOUND:Class;
		
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
		 * Happiness sound effect
		 */ 
		[Embed(source = "/assets/sounds.swf#happiness")]
		public static const HAPPINESS_SOUND:Class;

		/**
		 * FlashPunk splash assets
		 */
		[Embed(source = "/assets/splash_lines.png")] 
		public static const SPLASH_LINES:Class;
		
		[Embed(source = "/assets/splash_cog.png")] 
		public static const SPLASH_COG:Class;
		
		[Embed(source = "/assets/splash_left.png")] 
		public static const SPLASH_LEFT:Class;
		
		[Embed(source = "/assets/splash_right.png")] 
		public static const SPLASH_RIGHT:Class;
		
		/**
		 * Gaming Fondue splash assets
		 */
		[Embed(source = "/assets/splash.png")] 
		public static const SPLASH:Class;
		
		/**
		 * Menu assets
		 */
		[Embed(source = "/assets/menu.png")] 
		public static const MENU:Class;
		
		/**
		 * TV scanlines
		 */
		[Embed(source = "/assets/scanlines.png")] 
		public static const SCANLINES:Class;
		
		/**
		 * Credits images
		 */
		[Embed(source = "/assets/credits_bg.png")] 
		public static const CREDITS_BG:Class;
		
		[Embed(source = "/assets/credits_floor.png")] 
		public static const CREDITS_FLOOR:Class;
		
		[Embed(source = "/assets/credits_front.png")] 
		public static const CREDITS_FRONT:Class;
	}
}
