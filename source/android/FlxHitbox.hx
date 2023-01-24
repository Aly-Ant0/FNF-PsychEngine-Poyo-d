package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class FlxHitbox extends FlxSpriteGroup {
	public var hitbox:FlxSpriteGroup;

	public var buttonLeft:FlxButton;
	public var buttonDown:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;

	public var orgAlpha:Float = 0.75;
	public var orgAntialiasing:Bool = true;
	
	public function new(?alphaAlt:Float = 0.75, ?antialiasingAlt:Bool = true) {
		super();

		orgAlpha = alphaAlt;
		orgAntialiasing = antialiasingAlt;

		buttonLeft = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);

		hitbox = new FlxSpriteGroup();
		hitbox.add(add(buttonLeft = createhitbox(0, 0, "left")));
		hitbox.add(add(buttonDown = createhitbox(320, 0, "down")));
		hitbox.add(add(buttonUp = createhitbox(640, 0, "up")));
		hitbox.add(add(buttonRight = createhitbox(960, 0, "right")));

		var hitbox_hint:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('androidcontrols/hitbox_hint'));
		hitbox_hint.antialiasing = orgAntialiasing;
		hitbox_hint.alpha = orgAlpha;
		add(hitbox_hint);
	}

	public function createhitbox(x:Float = 0, y:Float = 0, frames:String) {
		var button = new FlxButton(x, y);
		button.loadGraphic(FlxGraphic.fromFrame(getFrames().getByName(frames)));
		button.antialiasing = orgAntialiasing;
		button.alpha = 0;// sorry but I can't hard lock the hitbox alpha
		button.onDown.callback = function()
		{
			button.alpha = 1;
		}
		button.onUp.callback = function()
		{
		  button.alpha = 0;
		}
		hint.onOver.callback = hint.onDown.callback;
		hint.onOut.callback = hint.onUp.callback;
		return button;
	}

	public function getFrames():FlxAtlasFrames {
		return Paths.getSparrowAtlas('androidcontrols/hitbox');
	}

	override public function destroy():Void {
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
	}
}
