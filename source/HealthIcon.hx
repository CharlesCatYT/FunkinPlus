package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var char:String;
	public var isPlayer:Bool;
	public var isOldIcon:Bool;

	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	var uniqueIcons:Array<String> = ['bf-old', 'bf-pixel'];
	var pixelIcons:Array<String> = ['bf-pixel', 'senpai', 'spirit'];

	public function new(char:String, ?isPlayer:Bool = false)
	{
		super();

		this.char = char;
		this.isPlayer = isPlayer;

		isPlayer = isOldIcon = false;

		changeIcon(char);
		scrollFactor.set();
	}

	public function swapOldIcon()
	{
		(isOldIcon = !isOldIcon) ? changeIcon('bf-old') : changeIcon(char);
	}

	public function changeIcon(char:String)
	{
		if (!uniqueIcons.contains(char))
			char = char.split('-')[0];

		if (!OpenFlAssets.exists(Paths.image('icons/icon-' + char)))
			char = 'face';

		loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);

		antialiasing = !pixelIcons.contains(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
