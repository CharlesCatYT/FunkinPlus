package;

import flixel.FlxG;
import openfl.filters.ColorMatrixFilter;

class FilterManager
{
	static var bwFilter:Array<Float> = [
		0.33, 0.5, 0.16, 0, 0,
		0.33, 0.5, 0.16, 0, 0,
		0.33, 0.5, 0.16, 0, 0,
		   0,   0,    0, 1, 0
	];

	static var invertFilter:Array<Float> = [
		-1,  0,  0, 0, 255,
		 0, -1,  0, 0, 255,
		 0,  0, -1, 0, 255,
		 0,  0,  0, 1,   0
	];

	public static function apply():Void
	{
		var matrix = invertFilter;

		for (i in FlxG.cameras.list)
			i.setFilters([new ColorMatrixFilter(matrix)]);
	}
}
