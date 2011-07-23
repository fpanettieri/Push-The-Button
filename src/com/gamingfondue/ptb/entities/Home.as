package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Assets;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.ptb.entities.player.Player;
	
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.sound.SfxFader;
	
	/**
	 * Represents the player home
     * Used to control game cycles.
	 * Also, as soon as th player enter his home all televisions are turned on
	 * 
	 * @author: Fabio R. Panettieri
	 */ 
	public class Home extends Entity
	{
		/**
		 * Color used to determine work
		 */
		private static const BG:uint = 0xFF303030;
		
		/**
		 * Injected dependecy. Current level televisions
		 */
		public var tvs:Array;

		/**
		 * Injected dependecy. Player
		 */
		private var _player:Player;

		/**
		 * Injected dependecy. Habitable area
		 */
		private var _area:Rectangle;

		/**
		 * Indicates if the player it's inside home
		 */
		private var inside:Boolean;

		/**
		 * Used to iterate through tvs
		 */
		private var tv:Tv;
		
		/**
		 * Last played position
		 */ 
		public static var position:Number = 0;
		
		/**
		 * Sound played outside home
		 */
		private var sonata:Sfx;
		
		/**
		 * Used to fade sonata in
		 */
		private var fader:SfxFader;
		
		/**
		 * Home constructor
		 */ 
		public function Home()
		{
			super(0, 0);
			inside = false;
			tvs = [];
			layer = Layers.BG;
			sonata = new Sfx(Assets.SONATA_SAD);
		}

		/**
		 * Updates screen color, sound volume and panning
		 */ 
		override public function update():void 
		{
			// Only update state when all dependencies has been updated
			if(_area == null || _player == null || tvs == null) return;

			// Turn on tvs when player enters home
			if (!inside && _area.contains(_player.x, _player.y)) {
				inside = true;
				for each (tv in tvs) {
					tv.turnOn();
				}
				stopSonata();
			}

			// Turn off tvs when player leaves home
			if (inside && !_area.contains(_player.x, _player.y)) {
				inside = false;
				for each (tv in tvs) {
					tv.turnOff();
				}
				playSonata();
			}
		}
		
		/**
		 * Stop sonata playback on leave
		 */ 
		override public function removed():void
		{
			stopSonata();
		}
		
		/**
		 * Start playing sonata
		 */ 
		private function playSonata():void
		{
/*			fader = new SfxFader(sonata, null, Tween.ONESHOT);
			sonata.loop(0.1, 0, position);
			addTween(fader);
			fader.fadeTo(1, 1);*/
		}
		
		/**
		 * Pause sonata and store position
		 */ 
		private function stopSonata():void
		{
			position = sonata.position * 1000;
			sonata.stop();
		}

		/**
		 * Update home area
		 */ 
		public function set area(area:Rectangle):void
		{
			_area = area;
			x = area.x;
			y = area.y;
		}
		
		/**
		 * Inject player dependecy
		 */ 
		public function set player(player:Player):void
		{
			_player = player;
			for each (tv in tvs) {
				tv.player = player;
			}
		}
	}
}
