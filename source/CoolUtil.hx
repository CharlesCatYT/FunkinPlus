package;

import lime.utils.Assets;
import flixel.FlxG;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];

	public static function difficultyString():String
	{
		return difficultyArray[PlayState.storyDifficulty];
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	public static function camLerpShit(ease:Float):Float
	{
		return FlxG.elapsed / (1 / 60) * ease;
	}

	public static function coolLerp(a:Float, b:Float, ratio:Float):Float
	{
		return a + camLerpShit(ratio) * (b - a);
	}

	public static function framerateShit(frames:Float):Float
	{
		return 1 / FlxG.elapsed * frames / 60;
	}
}
