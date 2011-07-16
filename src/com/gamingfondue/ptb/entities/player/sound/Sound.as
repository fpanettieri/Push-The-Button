package com.gamingfondue.ptb.entities.player.sound
{
	import com.gamingfondue.ptb.constants.Assets;
	
	import net.flashpunk.Sfx;

	// TODO: remove this class
	public class Sound
	{
		private var jumping:Sfx;
		
		public function Sound()
		{
			jumping = new Sfx(Assets.JUMPING);
		}
		
		// TODO: remove this method
		public function play(sound:int):void
		{
			jumping.play();
		}
	}
}