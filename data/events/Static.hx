var static:FlxSprite;
var vignette:FlxSprite;

function onLoad()
{
	static = new FlxSprite(0, 0);
	static.frames = Paths.getSparrowAtlas('HomeStatic');
	static.animation.addByPrefix('static', 'HomeStatic', 24, true);
	static.updateHitbox();
	static.zIndex = 301;
	static.alpha = 0.000001;
	static.camera = camOther;
	add(static);
	static.animation.play('static');

	vignette = new BGSprite('vignette', 0, 0, 0, 0);
	vignette.camera = camOther;
	vignette.alpha = 0.000001;
	add(vignette);
}
function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Static':
			if (value1 == '1')
			{
				camZooming = false;
				static.alpha = 1;
				if (PlayState.SONG.song == "My Confession"){
					FlxTween.tween(FlxG.camera, {zoom: 2}, 0.01);
					vignette.alpha = 1;
					static.alpha = 0.2;
				}
			}
			if (value1 == '0')
			{
				static.alpha = 0;
				camZooming = true;
				if (PlayState.SONG.song == "My Confession"){
					FlxTween.tween(FlxG.camera, {zoom: 0.75}, 0.01);
					vignette.alpha = 0;
				}
			}
	}
}
