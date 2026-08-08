import funkin.Mods;
import funkin.game.huds.PsychHUD;
import flixel.util.FlxStringUtil;
import openfl.media.Sound;
if (Mods.currentModDirectory != 'ddto-main') return;

function onCreatePost(){
	timeBar.setColors(dad.healthColour, 0xFF000000);
	timeTxt.x = FlxG.width / 2;

	if (!PlayState.isPixelStage){
		playHUD.scoreTxt.setFormat(Paths.font('Aller_Rg.ttf'), 20, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreTxt.borderSize = 1.25;
	}
}

function onUpdate(){
	final curTime:Float = FlxMath.bound(getSongTime() - ClientPrefs.noteOffset, 0, game.songLength);
	songPercent = (curTime / game.songLength);
	var songCalc:Float = ((game.songLength - curTime) : curTime);
	timeBar.setColors(dad.healthColour, 0xFF000000);
	timeBar.x = playHUD.healthBar.x + 95;
	timeTxt.x = 0;
	if (!ClientPrefs.downScroll)
	{
		timeTxt.y = 23;
	}
	else{
		timeTxt.y = 680;
	}
	timeTxt.setFormat(Paths.font('Aller_Rg.ttf'), 18, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	if (PlayState.isPixelStage){
		timeTxt.setFormat(Paths.font('vcr.ttf'), 18, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timeTxt.y = 25;
		if (ClientPrefs.downScroll)
		{
			timeTxt.y = 682;
		}
	}
	if (game.playbackRate != "1")
	{
		timeTxt.text = PlayState.SONG.song + " (" + game.playbackRate + "x)" + " (" + FlxStringUtil.formatTime(Math.floor(songCalc / 1000), false) + ")";
	}
	else{
		timeTxt.text = PlayState.SONG.song + " (" + FlxStringUtil.formatTime(Math.floor(songCalc / 1000), false) + ")";
	}
}