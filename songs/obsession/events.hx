import lime.app.Application;

var vignette:FlxSprite;
var staticshock:FlxSprite;
var whiteflash:FlxSprite;
var blackScreen:FlxSprite;
var blackScreenBG:FlxSprite;
var blackScreentwo:FlxSprite;

function onLoad()
{
	vignette = new BGSprite('vignette', 0, 0, 0, 0);
	vignette.camera = camOther;
	vignette.alpha = 0.000001;
	add(vignette);
		whiteflash = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
			-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		whiteflash.scrollFactor.set();

		blackScreen = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
			-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		blackScreen.scrollFactor.set();

			whiteflash.cameras = [camOther];
			blackScreen.cameras = [camOther];
					staticshock = new FlxSprite();
					staticshock.frames = Paths.getSparrowAtlas('HomeStatic');
					staticshock.animation.addByPrefix('idle', 'HomeStatic', 24, true);
					staticshock.animation.play('idle');
					staticshock.scrollFactor.set();
					staticshock.setGraphicSize(Std.int(FlxG.width / defaultCamZoom));
					staticshock.updateHitbox();
					staticshock.screenCenter();
					staticshock.blend = BlendMode.COLORDODGE;
					staticshock.cameras = [camHUD];
					staticshock.alpha = 0.001;
					add(staticshock);

		blackScreenBG = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
			-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		blackScreenBG.alpha = 0.0001;
		blackScreenBG.scrollFactor.set();
		add(blackScreenBG);

		blackScreentwo = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
			-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		blackScreentwo.scrollFactor.set();
}

function onCreatePost()
{
	PlayState.instance.triggerEventNote("Alt Idle Animation", "dad", "-alt");
}

function onStepHit()
{
						switch (curStep)
						{
							case 432 | 448 | 464:
									PlayState.SONG.scrollSpeed -= 0.05;
							case 480:
									PlayState.SONG.scrollSpeed -= 0.05;

								FlxTween.tween(FlxG.camera, {zoom: 1.5}, (Conductor.stepCrotchet / 14), {ease: FlxEase.linear});
								{
									staticshock.visible = true;
									staticshock.alpha = 0;
									FlxTween.tween(staticshock, {alpha: 1}, (Conductor.stepCrotchet / 14), {
										ease: FlxEase.linear,
										onComplete: function(tween:FlxTween)
										{
											staticshock.alpha = 0.1;
										}
									});
								}
							case 544:
									songSpeed -= 0.1;

								add(whiteflash);
								add(blackScreen);
								FlxG.sound.play(Paths.sound('Lights_Shut_off'), 0.7);
								Application.current.window.fullscreen = true;
							case 552:
								// shit gets serious
								yuriGoCrazy();
							case 568:
								remove(blackScreen);
								FlxTween.tween(whiteflash, {alpha: 0.15}, 2.25, {ease: FlxEase.sineOut});
							case 848:
								add(blackScreen);
						}
}

function onEndSong(){
	Application.current.window.fullscreen = false;
}

function onDestroy(){
	Application.current.window.fullscreen = false;
}

	function yuriGoCrazy()
	{
		// yooo she gon da crazyy

		// visual setup
		camSpecialThing([475, 475], [850, 500], 1.4);
		camZooming = true;
		camFocus = false;
		blackScreenBG.alpha = 0.8;

		// character setup
		game.gf.playAnim('necksnap', true);
		boyfriend.x = dad.x + 250;

		// vignette + camera setup
		if (vignette != null)
		{
			add(vignette);
			vignette.alpha = 0.6;
		}
	}