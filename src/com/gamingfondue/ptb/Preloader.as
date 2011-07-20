package com.gamingfondue.ptb
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	
	[SWF(width = "640", height = "480")]
	public class Preloader extends Sprite
	{
		[Embed(source = 'net/flashpunk/graphics/04B_03__.TTF', embedAsCFF="false", fontFamily = 'default')]
		private static const FONT:Class;
		private static const SWF: String = "PushTheButton.swf";
		private static const BG_COLOR:uint = 0x333333;
		private static const FG_COLOR:uint = 0xFF9900;
		
		private var loader:Loader;
		private var progressBar: Shape;
		private var text: TextField;

		private var px:int;
		private var py:int;
		private var w:int;
		private var h:int;
		private var sh:int;
		
		public function Preloader ()
		{
			var sw:int = stage.stageWidth;
			sh = stage.stageHeight;
			
			w = stage.stageWidth * 0.8;
			h = 20;
			
			px = (sw - w) * 0.5;
			py = (sh - h) * 0.5;
			
			graphics.beginFill(BG_COLOR);
			graphics.drawRect(0, 0, sw, sh);
			graphics.endFill();
			
			graphics.beginFill(FG_COLOR);
			graphics.drawRect(px - 2, py - 2, w + 4, h + 4);
			graphics.endFill();
			
			progressBar = new Shape();
			addChild(progressBar);
			
			text = new TextField();
			text.textColor = FG_COLOR;
			text.selectable = false;
			text.mouseEnabled = false;
			text.defaultTextFormat = new TextFormat("default", 16);
			text.embedFonts = true;
			text.autoSize = "left";
			text.text = "0%";
			text.x = (sw - text.width) * 0.5;
			text.y = sh * 0.5 + h;
			addChild(text);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderProgress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderDone);
			loader.load(new URLRequest(SWF));
		}
		
		private function loaderProgress (e:ProgressEvent):void
		{
			var p:Number = e.bytesLoaded / e.bytesTotal;
			progressBar.graphics.clear();
			progressBar.graphics.beginFill(BG_COLOR);
			progressBar.graphics.drawRect(px, py, p * w, h);
			progressBar.graphics.endFill();
			text.text = int(p * 100) + "%";
		}
		
		private function loaderDone (e:Event):void
		{
			while(numChildren) removeChildAt(0);
			stage.addChild(loader);
			stage.removeChild(this);
		}
	}
}