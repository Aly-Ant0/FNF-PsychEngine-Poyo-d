package android;

import flixel.FlxG;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

// Mofifications by saw (m.a. jigsaw)
// VS Poyo hitbox mod by Poyo
class FlxHitbox extends FlxSpriteGroup 
{
	public var hitbox:FlxSpriteGroup;

	public var buttonLeft:FlxButton;
	public var buttonDown:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;

	public var buttonsArray:Array<FlxButton> = [
		buttonLeft,
		buttonRight,
		buttonUp,
		buttonRight
	];

	public function new()
	{
		super();

		for (i in 0...buttonsArray.length)
		{
			var button:FlxButton = buttonsArray[i];
			button = createHitbox((FlxG.width / buttonsArray.length) * (Std.int(i - 1)), i);
		}
	}

	public function createHitbox(x:Float = 0, y:Float = 0, widthSplit:Float):FlxButton
	{
		var button = new FlxButton(x, 0);
	  button.setGraphicSize(Std.int(FlxG.width / 4), FlxG.height);
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