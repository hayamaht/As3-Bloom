package bloom.components 
{

import bloom.core.TextBase;
import bloom.core.OmniCore;

import flash.display.DisplayObjectContainer;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;

/**
	 * Label
	 */
	public class Label extends TextBase {
		
		public function Label(p:DisplayObjectContainer = null, text:String = "") {
			super(p);
			
			type = TextFieldType.DYNAMIC;
			autoSize = TextFieldAutoSize.LEFT;
			
			selectable = mouseEnabled = tabEnabled = false;
			
			this.text = text;
			
			style = OmniCore.theme.label;
		}
		
		override public function dispose (gc:Boolean = false):void {
			super.dispose (gc);
			OmniCore.onThemeChanged.remove(onThemeChanged);
		}
		
		override protected function onThemeChanged():void {
			style = OmniCore.theme.label;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.Label]";
		}
		
	}

}