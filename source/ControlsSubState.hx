package;

import flixel.FlxG;

class ControlsSubState extends MusicBeatSubstate
{
	public function new()
	{
		super();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
	}
}
