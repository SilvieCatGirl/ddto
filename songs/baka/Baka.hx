var baka:FlxSprite;
var vignette:FlxSprite;

function onLoad()
{
	baka = new FlxSprite(0, 0);
	baka.frames = Paths.getSparrowAtlas('clubroom/BakaBGDoodles');
	baka.animation.addByPrefix('baka', 'Normal Overlay', 24, true);
	baka.animation.addByPrefix('rock', 'Rock Overlay', 24, true);
	baka.updateHitbox();
	baka.zIndex = 301;
	baka.alpha = 0.000001;
	baka.camera = camOther;
	add(baka);
	baka.animation.play('baka');
}
function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Baka':
			if (value1 == '1')
			{
				FlxTween.tween(baka, {alpha: 1}, 5, {ease: FlxEase.sineIn});
			}
			if (value1 == '0')
			{
				FlxTween.tween(baka, {alpha: 0}, 5, {ease: FlxEase.sineOut});
			}
			if (value1 == '2')
			{
				baka.animation.play('rock');
				camGame.shake(0.002, 5);
			}
			if (value1 == '3')
			{
				baka.animation.play('baka');
			}
	}
}
