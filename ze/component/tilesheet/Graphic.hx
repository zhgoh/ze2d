package ze.component.tilesheet;
import openfl.geom.Rectangle;
import ze.component.core.Component;
import ze.util.Screen;
import ze.util.TileSheetLayer;

/**
 * ...
 * @author Goh Zi He
 */
class Graphic extends Component
{
	public var layer(default, default):Int;
	public var width(default, null):Float;
	public var height(default, null):Float;
	public var flipped(default, default):Bool;
	public var visible(default, default):Bool;
	
	private var _screen:Screen;
	private var _tileData:Array<Float>;
	private var _name:String;
	private var _tileID:Int;
	private var _tileSheetLayer:TileSheetLayer;
	
	public function new(name:String) 
	{
		super();
		layer = 0;
		_name = name;
		_tileData = [];
		visible = true;
		width = 0;
		height = 0;
	}
	
	override function added():Void 
	{
		super.added();
		_screen = scene.screen;
		_tileSheetLayer = _screen.getLayer(_name);
	}
	
	override function update():Void 
	{
		super.update();
		if (!visible || _tileSheetLayer == null)
		{
			return;
		}
		
		if (width == 0 || height == 0)
		{
			var rect:Rectangle = _tileSheetLayer.getTileRect(_tileID);
			width = rect.width;
			height = rect.height;
		}
		
		var index:Int = 0;
		_tileData[index++] = transform.x;
		_tileData[index++] = transform.y;
		_tileData[index++] = _tileID;
		
		layer = _tileSheetLayer.addToDraw(layer, _tileData);
	}
}