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

	public function new()
	{
		super();

		hitbox = new FlxSpriteGroup();

		buttonLeft = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);
	}

	public function createHitbox(x:Float = 0, y:Float = 0, frames:String, ?color:Int):FlxButton
	{
		var hint:FlxHitboxHint = new FlxHitboxHint(x, y, frames);
		hint.antialiasing = ClientPrefs.globalAntialiasing;
		hint.setGraphicSize(Std.int(FlxG.width / 4), FlxG.height);
		hint.updateHitbox();
		hint.solid = false;
		hint.immovable = true;
		hint.alpha = 0.1;
		hint.scrollFactor.set();
		return hint;
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

class FlxHitboxHint extends FlxButton
{
	public function new(x:Float = 0, y:Float = 0, frames:String)
	{
		super(x, y);

		loadGraphic(FlxGraphic.fromFrame(getFrames().getByName(frames)));
		alpha = 0.00001;

		#if FLX_DEBUG
		ignoreDrawDebug = true;
		#end
	}

	override function update(elapsed:Float)
	{
		if (pressed && alpha != 1)
			alpha = 1;
		else if (!pressed && alpha != 0.1)
			alpha = 0.1;
	}

	public function getFrames():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('androidcontrols/hitbox');
	}
}
