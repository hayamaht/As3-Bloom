package bloom.containers {

import bloom.core.Component;
import bloom.core.IComponent;
import bloom.core.OmniCore;
import bloom.style.containers.ContainerStyle;

import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;

/**
 * Container
 */
public class Container extends Component {

	protected var background:BitmapData;
	protected var container:Sprite;
	private var _maskContent:Boolean;

	public function Container (p:DisplayObjectContainer = null) {
		super (p);
		container = this;
	}

	override protected function onThemeChanged ():void {
		_style = OmniCore.defaultTheme.containerStyle;
		super.onThemeChanged ();
	}

	public function addContent (content:IComponent):void {
		if (content is IComponent) {
			content.drawDirectly ();
			container.addChild (DisplayObject (content));
		}
	}

	override protected function draw (e:Event = null):void {
		if (! _changed) return;
		_changed = false;

		containerStyle.background.update (_state,this,getDimensionObject);

		positionContent ();

		applyMask ();

	}

	private function applyMask ():void {
		_maskContent ? container.scrollRect = new Rectangle (0,0,_width,_height) : container.scrollRect = null;
	}

	public function positionContent ():void {

	}

	///////////////////////////////////
	// getter/setters
	///////////////////////////////////

	public function get containerStyle ():ContainerStyle {
		return _style as ContainerStyle;
	}

	public function get maskContent ():Boolean {
		return _maskContent;
	}

	public function set maskContent (value:Boolean):void {
		if (value != _maskContent) {
			_maskContent = value;
			applyMask ();
		}
	}

///////////////////////////////////
	// Dispose
	///////////////////////////////////

	override public function dispose (gc:Boolean = false):void {
		super.dispose (gc);
		if (background) background.dispose ();
		background = null;
	}

	///////////////////////////////////
	// toString
	///////////////////////////////////

	public override function toString ():String {
		return "[bloom.components.Container]";
	}
}

}
