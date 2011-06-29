package com.gamingfondue.ptb.player.sound
{
	import com.gamingfondue.ptb.constants.Assets;
	
	import net.flashpunk.Sfx;

	public class Sound
	{
		private var sonata:Sfx;
		private var jumping:Sfx;
		
		public function Sound()
		{
			sonata = new Sfx(Assets.SONATA);
			jumping = new Sfx(Assets.JUMPING);
			//sonata.loop(0.2);
		}
		
		public function play(sound:int):void
		{
			switch(sound){
				case Sounds.JUMPING: jumping.play(); break;
			}
		}
	}
}