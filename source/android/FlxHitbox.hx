package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxBasic;
import flixel.FlxG;

// Mofifications by saw (m.a. jigsaw)
// hitbox mod by Poyo
class FlxHitbox extends FlxSpriteGroup 
{
	public var hitbox:FlxSpriteGroup;

	public var buttonLeft:FlxButton;
	public var buttonDown:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;

	public var buttonsArray:Array<FlxBasic> = [
		buttonLeft,
		buttonRight,
		buttonUp,
		buttonRight
	];

	public function new()
	{
		super();
		var xPos = FlxG.width / buttonsArray.length;

		for (i in 0...buttonsArray.length)
		{
			buttonsArray[i] = createHitbox(xPos * (i - 1), 0, buttonsArray.length);
			add(buttonsArray[i]);
		}
	}

	public function createHitbox(x:Float = 0, y:Float = 0, widthSplit:Float):FlxButton
	{
		var button = new FlxButton(x, 0);
	  button.setGraphicSize(Std.int(FlxG.width / buttonsArray.length), FlxG.height);
	  button.updateHitbox();
	  button.alpha = 0;
	  return button;
	}

	override function destroy()
	{
		super.destroy();

		hitbox = FlxDestroyUtil.destroy(hitbox);
		hitbox = null;

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
	}
}