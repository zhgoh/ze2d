package action.game;
import action.player.CharacterController;
import ze.component.core.Component;
import ze.util.Input;

/**
 * ...
 * @author Goh Zi He
 */
class MouseSelectMovement extends Component
{
	private var _isMoving:Bool;
	private var _characterController:CharacterController;
	
	override public function added():Void 
	{
		super.added();
		_characterController = getComponent(CharacterController);
	}
	
	override public function update():Void 
	{
		if (collider == null && graphic == null)
		{
			trace("No collider/graphic found on entity for MouseSelect to work");
			return;
		}
		
		if (Input.leftMouseDown() && inEntity())
		{
			_characterController.enable = false;
			_isMoving = true;
		}
		
		if (Input.leftMouseReleased())
		{
			_characterController.enable = true;
			_isMoving = false;
		}
		
		if (_isMoving)
		{
			gameObject.transform.setPos(Input.mouseX, Input.mouseY);
		}
		super.update();
	}
	
	private function inEntity():Bool 
	{
		var x:Float = transform.x;
		var y:Float = transform.y;
		var mx:Float = Input.mouseX;
		var my:Float = Input.mouseY;
		var width:Float = graphic.width;
		var height:Float = graphic.height;
		return (mx > x && mx < x + width && my > y && y < y + height);
	}
}