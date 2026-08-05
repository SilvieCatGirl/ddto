var sparkleBG:FlxBackdrop;
var sparkleFG:FlxBackdrop;
var pinkOverlay:FlxSprite;

function onLoad()
{
	pinkOverlay = new FlxSprite(-FlxG.width * FlxG.camera.zoom, -FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFFF281F2);
	pinkOverlay.alpha = 0.2;
	pinkOverlay.blend = BlendMode.SCREEN;
	pinkOverlay.scrollFactor.set();
	pinkOverlay.camera = camOther;

	sparkleBG = new FlxBackdrop(Paths.image('clubroom/YuriSparkleBG'));
	sparkleBG.scrollFactor.set(0.1, 0);
	sparkleBG.velocity.set(-16, 0);
	sparkleBG.visible = false;
	sparkleBG.setGraphicSize(Std.int(sparkleBG.width / defaultCamZoom));
	sparkleBG.updateHitbox();
	sparkleBG.screenCenter();
	sparkleBG.camera = camOther;
	add(sparkleBG);

	sparkleFG = new FlxBackdrop(Paths.image('clubroom/YuriSparkleFG'));
	sparkleFG.scrollFactor.set(0.1, 0);
	sparkleFG.velocity.set(-48, 0);
	sparkleFG.setGraphicSize(Std.int((sparkleFG.width * 1.2) / defaultCamZoom));
	sparkleFG.updateHitbox();
	sparkleFG.screenCenter();
	sparkleFG.camera = camOther;
}

function onStepHit()
{
	switch (curStep)
	{
		case 138:
			dad.playAnim('breath');
			dad.specialAnim = true;
		case 148:
			FlxG.sound.play(Paths.sound('exhale', null, PathsTestMode.LOOSE));
	}
}

function onBeatHit()
{
				switch (curBeat)
				{
					case 104:
						sparkleBG.visible = true;
						add(sparkleFG);
						add(pinkOverlay);
					case 200:
						FlxTween.tween(sparkleBG, {alpha: 0}, 2.5, {ease: FlxEase.sineOut});
						FlxTween.tween(sparkleFG, {alpha: 0}, 2.5, {ease: FlxEase.sineOut});
						FlxTween.tween(pinkOverlay, {alpha: 0}, 2.5, {ease: FlxEase.sineOut});
					case 232:
						sparkleBG.alpha = 1;
						sparkleFG.alpha = 1;
						pinkOverlay.alpha = 0.2;
					case 288:
						FlxTween.tween(sparkleBG, {alpha: 0}, 5, {ease: FlxEase.sineOut});
						FlxTween.tween(sparkleFG, {alpha: 0}, 5, {ease: FlxEase.sineOut});
						FlxTween.tween(pinkOverlay, {alpha: 0}, 5, {ease: FlxEase.sineOut});
				}
}