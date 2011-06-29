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
		 * Jumping sound effect
		 */ 
		[Embed(source = "/assets/sounds.swf#sonata")]
		public static const SONATA:Class;
		
		/**
		 * Jumping sound effect
		 */ 
		[Embed(source = "/assets/sounds.swf#jumping")]
		public static const JUMPING:Class;
	}
}