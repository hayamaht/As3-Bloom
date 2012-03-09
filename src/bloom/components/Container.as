package bloom.components 
{

import bloom.core.Component;
import bloom.core.OmniCore;
import bloom.components.ContainerStyle;

import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.events.Event;

/**
	 * Container
	 */
	public class Container extends Component {
		
		protected var background:BitmapData;
		
		public function Container(p:DisplayObjectContainer = null) {
			super(p);
//			_style = ThemeBase.theme.container;
			size(100, 100);
		}
		
		override public function dispose (gc:Boolean = false):void {
			super.dispose (gc);
			if (background) background.dispose();
			background = null;
		}
		
		override protected function onThemeChanged():void {
//			style = ThemeBase.theme.container;
		}
		
		override protected function draw (e:Event = null):void {
			if (!_changed) return;
			_changed = false;
			
//			var style:ContainerStyle = _style as ContainerStyle;
//			if (background) background.dispose();
			
//			graphics.clear();
//			style.background.setSize(_width, _height);
//			background = style.background.bitmapData.clone();
//			graphics.beginBitmapFill(background);
//			graphics.drawRect(0, 0, _width, _height);
//			graphics.endFill();
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public override function toString():String {
			return "[bloom.components.Container]";
		}
	}

}