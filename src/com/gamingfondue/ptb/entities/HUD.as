package com.gamingfondue.ptb.entities
{
	import com.gamingfondue.ptb.constants.Languages;
	import com.gamingfondue.ptb.constants.Layers;
	import com.gamingfondue.util.Logger;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;

	public class HUD extends Entity
	{
		private static var _dirty:Boolean = true;
		private static var _age:Number = 0;
		private static var _money:Number = 0;
		private static var _happiness:Number = 0;

		private var age:Text;
		private var money:Text;
		private var happiness:Text;
		
		private var display:Graphiclist;
		
		public function HUD()
		{
			age = new Text("", 5, 0, 90, 30);
			age.scrollX = 0;
			age.scrollY = 0;
			age.color = 0xFFFFFF;
			
			money = new Text("", 130, 0, 120, 30);
			money.scrollX = 0;
			money.scrollY = 0;
			money.color = 0xFFFFFF;
			
			happiness = new Text("", 270, 0, 50, 30);
			happiness.scrollX = 0;
			happiness.scrollY = 0;
			happiness.color = 0xFFFFFF;
			
			display = new Graphiclist(age, money, happiness);
			graphic = display;
			
			_dirty = true;
			layer = Layers.HUD;
		}
		
		override public function update():void
		{
			if (_dirty) {
				_dirty = false;
				
				if (Statistics.language == Languages.EN) {
					age.text = "Age: " + _age;
				} else {
					age.text = "Edad: " + _age;
				}
				money.text = "$ " + _money;
				happiness.text = ":) " + _happiness;
			}
		}
		
		public static function set age(value:Number):void
		{
			_age = value;
			_dirty = true;
		}
		
		public static function get age():Number
		{
			return _age;
		}
		
		public static function set money(value:Number):void
		{
			_money = value;
			_dirty = true;
		}
		
		public static function get money():Number
		{
			return _money;
		}
		
		public static function set happiness(value:Number):void
		{
			_happiness = value;
			_dirty = true;
		}
		
		public static function get happiness():Number
		{
			return _happiness;
		}
	}
}