package com.gamingfondue.ptb
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
	}
}