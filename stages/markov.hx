	var closet:BGSprite;
	var clubroom:BGSprite;
	var deskfront:BGSprite;
	var evilSpace:FlxBackdrop;
	var clouds:FlxBackdrop;
	var fancyclouds:FlxBackdrop;
	var windowlight:BGSprite;
	var clubroomdark:BGSprite;
	var evilClubBG:BGSprite;
	var evilClubBGScribbly:BGSprite;
	var ruinedClubBG:BGSprite;
	var glitchfront:BGSprite;
	var glitchback:BGSprite;
	var evilPoem:BGSprite;
	var bloodyBG:BGSprite;
	var poemTransition:BGSprite;
	var closetCloseUp:BGSprite;

	var vignette:FlxSprite;
	var imdead:FlxSprite;
	var darkScreen:FlxSprite;
	var titleCard:FlxSprite;
	var darkoverlay:FlxSprite;

	var daStatic:BGSprite;
	var stagstatic:BGSprite;
	var screenPulse:BGSprite;
	var holylight:BGSprite;
	var redStatic:BGSprite;
	var inthenotepad:BGSprite;
	var notepadoverlay:BGSprite;
	var stageStatic:BGSprite;
	var bgwindo:FlxBackdrop;
	var bgwindo2:FlxBackdrop;
	var cambgwindo:FlxBackdrop;
	var cambgwindo2:FlxBackdrop;
	var bakaOverlay:BGSprite;
	var funnyEyes:BGSprite;

	var staticAlpha:Float = 0;
	var bloodDrips:Bool = false;

function onLoad()
{
					evilSpace = new FlxBackdrop(Paths.image('bigmonika/Sky'));
					evilSpace.scrollFactor.set(0.1, 0.1);
					evilSpace.velocity.set(-10, 0);
					evilSpace.y -= 300;
					evilSpace.antialiasing = ClientPrefs.globalAntialiasing;
					add(evilSpace);

					clouds = new FlxBackdrop(Paths.image('bigmonika/Clouds'));
					clouds.scrollFactor.set(0.1, 0.1);
					clouds.velocity.set(-13, 0);
					clouds.y -= 300;
					clouds.antialiasing = ClientPrefs.globalAntialiasing;
					clouds.scale.set(0.7, 0.7);
					add(clouds);

					fancyclouds = new FlxBackdrop(Paths.image('bigmonika/mask'));
					fancyclouds.scrollFactor.set(0.1, 0.1);
					fancyclouds.velocity.set(-13, 0);
					fancyclouds.y -= 300;
					fancyclouds.antialiasing = ClientPrefs.globalAntialiasing;
					fancyclouds.scale.set(0.7, 0.7);
					fancyclouds.alpha = 1;
					add(fancyclouds);

				evilClubBG = new BGSprite('bigmonika/BG', -220, -110, 1, 1);
				evilClubBG.setGraphicSize(Std.int(evilClubBG.width * 1.3));
				add(evilClubBG);

					clubroomdark = new BGSprite('bigmonika/shadow', -220, -110, 1, 1);
					clubroomdark.setGraphicSize(Std.int(clubroomdark.width * 1.3));

					windowlight = new BGSprite('bigmonika/WindowLight', -220, -110, 1, 1);
					windowlight.setGraphicSize(Std.int(windowlight.width * 1.3));
					add(windowlight);

				evilClubBGScribbly = new BGSprite('BGsketch', -220, -110, 1, 1, ['BGSketch'], true);
				evilClubBGScribbly.setGraphicSize(Std.int(evilClubBGScribbly.width * 1.3));
				evilClubBGScribbly.visible = false;
				evilClubBGScribbly.alpha = 0;
				add(evilClubBGScribbly);

				evilPoem = new BGSprite('markovend', -220, -110, 1, 1);
				evilPoem.setGraphicSize(Std.int(evilPoem.width * 1.3));
				evilPoem.visible = false;
				add(evilPoem);

				bloodyBG = new BGSprite('bgBlood', -220, 0, 1, 1, ['bgBlood'], false);
				bloodyBG.animation.addByPrefix('bgBlood', 'bgBlood', 12, false);
				bloodyBG.setGraphicSize(Std.int(bloodyBG.width * 1.3));
				bloodyBG.alpha = 0.001;
				add(bloodyBG);

				closetCloseUp = new BGSprite('ClosetBG', -250, 0, 1, 1);
				closetCloseUp.setGraphicSize(Std.int(closetCloseUp.width * 0.85));
				closetCloseUp.updateHitbox();
				closetCloseUp.visible = false;
				add(closetCloseUp);

				funnyEyes = new BGSprite('EyeMidwayBG', 0, 0, 1, 1, ['Midway'], true);
				funnyEyes.antialiasing = ClientPrefs.globalAntialiasing;
				funnyEyes.alpha = 0.0001;
				funnyEyes.cameras = [camOther];
				funnyEyes.setGraphicSize(Std.int(FlxG.width));
				funnyEyes.updateHitbox();
				funnyEyes.screenCenter();
				add(funnyEyes);

		//stealing this from DDTO
		vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('vignette'));
		vignette.scrollFactor.set();
		vignette.cameras = [camOther];
		vignette.alpha = 0.00001;
		add(vignette);

		screenPulse = new BGSprite('vignetteend', 0, 0, 1, 1);
		screenPulse.cameras = [camOther];
		screenPulse.setGraphicSize(FlxG.width, FlxG.height);
		screenPulse.screenCenter();
		screenPulse.alpha = 0.0001;
		add(screenPulse);

		daStatic = new BGSprite('daSTAT', 0, 0, 1.0, 1.0, ['staticFLASH'], true);
		daStatic.cameras = [camOther];	
		daStatic.setGraphicSize(FlxG.width, FlxG.height);
		daStatic.screenCenter();
		daStatic.alpha = 0.0001;
		add(daStatic);

		redStatic = new BGSprite('ruinedclub/HomeStatic', 0, 0, 1, 1, ['HomeStatic'], true);
		redStatic.cameras = [camOther];
		redStatic.setGraphicSize(FlxG.width, FlxG.height);
		redStatic.screenCenter();
		redStatic.alpha = 0.0001;
		add(redStatic);

		cambgwindo = new FlxBackdrop(Paths.image('ruinedclub/bgwindows2'));
		cambgwindo.velocity.set(-40, 0);
		cambgwindo.antialiasing = ClientPrefs.globalAntialiasing;
		cambgwindo.alpha = 0.0001;
		add(cambgwindo);

		cambgwindo2 = new FlxBackdrop(Paths.image('ruinedclub/bgwindows'));
		cambgwindo2.velocity.set(-60, 0);
		cambgwindo2.antialiasing = ClientPrefs.globalAntialiasing;
		cambgwindo2.alpha = 0.0001;
		add(cambgwindo2);

		stagstatic = new BGSprite('stagnant_glitch', 0, 0, 1.0, 1.0, ['sadface 2'], false);
		stagstatic.cameras = [camOther];
		stagstatic.setGraphicSize(FlxG.width, FlxG.height);
		stagstatic.screenCenter();
		stagstatic.alpha = 0.0001;
		add(stagstatic);

		holylight = new BGSprite('deadlight', 0, 0, 1, 1);
		holylight.cameras = [camOther];
		holylight.setGraphicSize(FlxG.width, FlxG.height);
		holylight.screenCenter();
		holylight.alpha = 0.0001;
		add(holylight);

		darkoverlay = new FlxSprite(-FlxG.width * FlxG.camera.zoom, -FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		darkoverlay.alpha = 0.0001;
		darkoverlay.scrollFactor.set(0, 0);
		add(darkoverlay);

				imdead = new FlxSprite(0, 0).loadGraphic(Paths.image('everyoneisdead'));
				imdead.scrollFactor.set();
				imdead.cameras = [camOther];
				imdead.alpha = 0.00001;
				add(imdead);

				darkScreen = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
				add(darkScreen);
				darkScreen.cameras = [camOther];

				titleCard = new FlxSprite();
				titleCard.frames = Paths.getSparrowAtlas('titlecards/markov');
				titleCard.animation.addByPrefix('idle', 'card', 24, true);
				titleCard.animation.play('idle');
				titleCard.antialiasing = ClientPrefs.globalAntialiasing;
				titleCard.cameras = [camOther];
				titleCard.screenCenter();
				titleCard.alpha = 0.001;
				titleCard.scale.set(0.8,0.8);
				add(titleCard);

}

function onEvent(eventName, value1, value2)
{
	{
		switch (eventName)
		{
			case 'remove darkScreen':
				if (darkScreen != null)
				{
					var val1:Float = Std.parseFloat(value1);
					var val2:Float = Std.parseFloat(value2);

					if (Math.isNaN(val1) || val1 == 0)
					{
						val1 = 0.0001;
					}
					if (Math.isNaN(val2) || val2 == 0)
					{
						val2 = 0.0001;
					}
					
					if (val1 != 0)
					{
						FlxTween.tween(darkScreen, {alpha: val2}, val1, {ease: FlxEase.linear});
					}
				}
			case 'Screen in Darkness':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				if (Math.isNaN(val1) || val1 == 0)
				{
					val1 = 0.0001;
				}
				if (Math.isNaN(val2) || val2 == 0)
				{
					val2 = 0.0001;
				}
				if (val1 >= 1)
				{
					val1 = 1;
				}
				FlxTween.cancelTweensOf(darkoverlay);
				FlxTween.tween(darkoverlay, {alpha: val1}, val2, {ease: FlxEase.linear});

			case 'Change Stagnant Stage':
				var val2:Float = Std.parseFloat(value2);
				if (Math.isNaN(val2))
					val2 = 0;

						closetCloseUp.visible = false;
				
				evilClubBGScribbly.alpha = 0.0001;

				switch (value1)
				{
					default:
						closet.visible = true;
						clubroom.visible = true;
						if (!ClientPrefs.lowQuality) deskfront.visible = true;
					case 'evil':
						defaultCamZoom = 0.8;
						FlxG.camera.zoom = 0.8;
						if (!ClientPrefs.lowQuality)
						{
							evilSpace.visible = true;
							clouds.visible = true;
							fancyclouds.visible = true;
							windowlight.visible = true;
							clubroomdark.visible = true;
						}
						evilClubBG.visible = true;
						evilClubBGScribbly.visible = true;
						FlxTween.tween(boyfriend, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(gf, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(dad, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
					case 'poem':
						defaultCamZoom = 0.9;
						FlxG.camera.zoom = 0.9;
						evilPoem.visible = true;
						FlxTween.tween(boyfriend, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(gf, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(dad, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
					case 'markovpoem':
						defaultCamZoom = 0.9;
						FlxG.camera.zoom = 0.9;
						evilPoem.visible = true;
						bloodyBG.alpha = 1;
						bloodyBG.animation.play('bgBlood');
						screenPulse.alpha = 1;
						funnyEyes.setGraphicSize(Std.int(bloodyBG.width * 1.3));
						funnyEyes.cameras = [camOther];
						funnyEyes.alpha = 1;
						GameOverSubstate.markovGameover = true;
						FlxTween.tween(boyfriend, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(gf, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(dad, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
					case 'closet':
						defaultCamZoom = 1.0;
						FlxG.camera.zoom = 1.0;
						closetCloseUp.visible = true;
						GameOverSubstate.markovGameover = true;
						FlxTween.tween(boyfriend, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(gf, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
					case 'ruined' | 'ruinedclub':
						defaultCamZoom = 0.8;
						FlxG.camera.zoom = 0.8;
						stageStatic.visible = true;
						if (!ClientPrefs.lowQuality)
						{
							bgwindo.visible = true;
							bgwindo2.visible = true;
						}
						ruinedClubBG.visible = true;
						glitchfront.visible = true;
						glitchback.visible = true;
						FlxTween.tween(boyfriend, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(gf, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(dad, {alpha: 1}, 0.0000001, {ease: FlxEase.circOut});
					case 'notepad':
						//fates are written, cause pandora didn't listen, time will march here with me, the screams of last you'll ever see
						//I will kill you, I am marty the armidillou,the stinky smells won't deter me, I will drink all your pee
						defaultCamZoom = 1.0;
						FlxG.camera.zoom = 1.0;
						//We are going to lock the camera for this event
						stageStatic.visible = true;
						if (!ClientPrefs.lowQuality)
						{
							bgwindo.visible = true;
							bgwindo2.visible = true;
						}
						inthenotepad.visible = true;
						notepadoverlay.visible = true;
						isCameraOnForcedPos = true;
						camFollow.set(650, 360);
						camFollowPos.setPosition(650, 360);
						boyfriendGroup.x = 430;
						boyfriendGroup.y = -140;
						FlxTween.tween(gf, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
						FlxTween.tween(dad, {alpha: 0}, 0.0000001, {ease: FlxEase.circOut});
					case 'void':
						defaultCamZoom = 0.9;
						FlxG.camera.zoom = 0.9;
						//basically don't unhide anything lmao
					case 'redstatic':
						defaultCamZoom = 0.9;
						FlxG.camera.zoom = 0.9;
						stageStatic.visible = true;
				}
				if (val2 > 0)
				{
					FlxTween.tween(evilClubBGScribbly, {alpha: 1}, val2, {
						ease: FlxEase.sineIn,
						onComplete: function(twn:FlxTween)
						{
							evilClubBGScribbly.alpha = 1;
						}
					});
				}
			case 'Glitch increase':
				switch (Std.parseFloat(value1))
				{
					case 1:
						FlxTween.tween(daStatic, {alpha: 0.65}, 3.5, {ease: FlxEase.circOut});
					case 2:
						FlxTween.cancelTweensOf(daStatic);
						daStatic.visible = false;
					case 3:
						FlxTween.cancelTweensOf(daStatic);
						daStatic.visible = true;
					case 4:
						FlxTween.cancelTweensOf(daStatic);
						remove(daStatic);
				}
			case 'Stagnant Glitch':
				stagstatic.dance();
				stagstatic.alpha = 1;
			case 'Move Character':
				var charType:Int = 0;
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);

				switch (value3)
				{
					case 'dad' | 'Dad' | 'DAD':
						charType = 1;
					case 'gf' | 'GF' | 'girlfriend' | 'Girlfriend':
						charType = 2;
					default:
						charType = 0;
				}

				switch (charType)
				{
					case 1:
						if (Math.isNaN(val1)) dadGroup.x = DAD_X;
						else dadGroup.x = val1;

						if (Math.isNaN(val2)) dadGroup.y = DAD_Y;
						else dadGroup.y = val2;
					case 2:
						if (Math.isNaN(val1)) gfGroup.x = GF_X;
						else gfGroup.x = val1;
						
						if (Math.isNaN(val2)) gfGroup.y = GF_Y;
						else gfGroup.y = val2;
					default:
						if (Math.isNaN(val1)) boyfriendGroup.x = BF_X;
						else boyfriendGroup.x = val1;

						if (Math.isNaN(val2)) boyfriendGroup.y = BF_Y;
						else boyfriendGroup.y = val2;
				}
			case 'Move Opponent Tween':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);

				if (Math.isNaN(val1))
					val1 = DAD_X;
				if (Math.isNaN(val2))
					val2 = DAD_Y;

				FlxTween.cancelTweensOf(dadGroup);
				FlxTween.tween(dadGroup, {x: val1, y: val2}, 0.10, {ease: FlxEase.circOut});

			case 'Move Boyfriend Tween':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);

				if (Math.isNaN(val1))
					val1 = BF_X;
				if (Math.isNaN(val2))
					val2 = BF_Y;

				FlxTween.cancelTweensOf(boyfriendGroup);
				FlxTween.tween(boyfriendGroup, {x: val1, y: val2}, 0.10, {ease: FlxEase.circOut});

			case 'Change Camera Zoom':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);

				if (Math.isNaN(val1))
					val1 = defaultCamZoom;

				// if value2 isn't a numerical value, then rely on defaultCamZoom
				if (Math.isNaN(val2))
				{
					var forceBool:Bool = false;
					if (value2 == 'true')
						forceBool = true;
	
					defaultCamZoom = val1;
					if (forceBool)
						FlxG.camera.zoom = val1;
				}
				else
				{
					FlxTween.tween(FlxG.camera, {zoom: val1}, val2, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween)
						{
							defaultCamZoom = val1;
						}
					});
				}

			case 'Add/Remove Vignette':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				// Value 1 for alpha
				// Value 2 for speed it appears
				FlxTween.cancelTweensOf(vignette);

				if (Math.isNaN(val1))
					val1 = 0;
				if (Math.isNaN(val2) || val2 == 0)
					val2 = 0.0001;
			
				trace(val1 + ' & ' + val2);

				if (val2 != 0)
					FlxTween.tween(vignette, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});
			case 'Red Static':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				// Value 1 for alpha
				// Value 2 for speed it appears
				FlxTween.cancelTweensOf(redStatic);

				if (Math.isNaN(val1))
					val1 = 0;
				if (Math.isNaN(val2) || val2 == 0)
					val2 = 0.0001;
			
				trace(val1 + ' & ' + val2);

				if (val2 != 0)
					FlxTween.tween(redStatic, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});
			case 'Show death screen':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);

				if (value1 == null || value1 == 'false')
					val1 = 0.00001;

				if (Math.isNaN(val2) || val2 == 0)
					val2 = 0.0001;
				forcecamZooming = false;
				camZooming = false;
				FlxTween.tween(imdead, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});
				FlxTween.tween(cambgwindo, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});
				FlxTween.tween(cambgwindo2, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});

			case 'UI visibilty':
				if (value1 == null || value1 == 'false')
				{
					healthBar.visible = false;
					iconP1.visible = false;
					iconP2.visible = false;
					scoreTxt.visible = false;
					botplayTxt.visible = false;
					timeBar.visible = false;
					timeTxt.visible = false;
				}
				if (value1 == 'true')
				{
					healthBar.visible = true;
					iconP1.visible = true;
					iconP2.visible = true;
					scoreTxt.visible = true;

					if (cpuControlled)
						botplayTxt.visible = true;

					timeBar.visible = true;
					timeTxt.visible = true;
				}
			case 'Poem Transition':
				var tweenBool:Bool = true;
				if (value1 == 'false')
					tweenBool = false;

				if (tweenBool)
				{
					poemTransition.visible = true;
					poemTransition.alpha = 1;
					poemTransition.animation.play('poemtransition', true);
				}
				else
				{
					FlxTween.tween(poemTransition, {alpha: 0}, 0.25, {
						ease: FlxEase.sineOut,
						onComplete: function(twn:FlxTween)
						{
							poemTransition.alpha = 0;
							poemTransition.visible = false;
						}
					});
				}

			case 'Tint Character':
				//Only used for home but might as well make it universal
				var char:Character = boyfriend;
				switch (value2.toLowerCase)
				{
					default:
						char = boyfriend;
					case 'gf' | 'girlfriend':
						char = gf;
					case 'dad':
						char = dad;
					case 'yuri':
						char = extra2;
					case 'sayori':
						char = extra1;
				}
				
				switch (value1.toLowerCase())
				{
					case 'red':
						char.color = FlxColor.RED;
					case 'black':
						char.color = FlxColor.BLACK;
					case 'gray' | 'grey':
						char.color = FlxColor.GRAY;
					case 'white' | 'default':
						char.color = FlxColor.WHITE;
				}

			case 'Eye Popup':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				var eye:FlxSprite = new FlxSprite(val1, val2);
				eye.frames = Paths.getSparrowAtlas('MarkovEyes');
				eye.animation.addByPrefix('idle', 'MarkovWindow', 24, false);
				eye.animation.play('idle');
				eye.antialiasing = ClientPrefs.globalAntialiasing;
				eye.scrollFactor.set();
				eye.cameras = [camOther];
				add(eye);

				// goku goes super saiyan
				new FlxTimer().start(4.61, function(tmr:FlxTimer)
				{
					remove(eye);
					eye.destroy();
				});

			case 'Summon Sayori or Yuri':
				var char:Character = extra1;
				var val2:Float = Std.parseFloat(value2);
				switch (value1)
				{
					case 'sayori' | 'sayo' | 'Sayori':
						char = extra1;
					case 'yuri' | 'Yuri':
						char = extra2;
				}

				if (Math.isNaN(val2) || val2 == 0)
					val2 = 0.0001;

				FlxTween.tween(char, {alpha: 1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});
			case 'Cat Doodles Stuff':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				//value 1 handles alpha
				//value 2 speed
				//value 3 kills the cats

				if (Math.isNaN(val1) || val1 == 0)
					val1 = 0.00001;

				if (Math.isNaN(val2) || val2 == 0)
					val2 = 0.0001;

				if (value3 == null || value3 == '')
					FlxTween.tween(bakaOverlay, {alpha: val1}, val2, {ease: FlxEase.linear, onComplete: function(twn:FlxTween){}});

				if (value3 != null && value3 != '')
				{
					bakaOverlay.animation.play('hueh');
					new FlxTimer().start(4, function(tmr:FlxTimer)
					{
						bakaOverlay.alpha = 0;
					});
				}
			case 'Play SFX':
				var val2:Float = Std.parseFloat(value2);

				if (Math.isNaN(val2))
					val2 = 1;

				FlxG.sound.play(Paths.sound(value1), val2);
			case 'Markov note spawns blood':
				switch (value1.toLowerCase())
				{
					case 'true':
						bloodDrips = true;
					default:
						bloodDrips = false;
				}
			case 'Spawn Red Eyes':
				if (funnyEyes != null)
				{
					switch (value1.toLowerCase())
					{
						default: // Spawn the eyes here	
							funnyEyes.alpha = 1;
							FlxG.camera.flash(FlxColor.RED, 0.5);
						case 'fadeout': // make em disappear here
							var val2:Float = Std.parseFloat(value2);
							if (Math.isNaN(val2))
								val2 = 1;
							FlxTween.tween(funnyEyes, {alpha: 0.001}, val2, {ease: FlxEase.circOut});
					}
				}
			case 'Stab Border':
				var val1:Float = Std.parseFloat(value1);
				if (Math.isNaN(val1))
					val1 = 0.5;
				FlxTween.cancelTweensOf(screenPulse);
				screenPulse.alpha = 1;
				FlxTween.tween(screenPulse, {alpha: 0.001}, val1, {ease: FlxEase.circOut});
			case 'Tween in the holy light':
				var val1:Float = Std.parseFloat(value1);
				var val2:Float = Std.parseFloat(value2);
				if (Math.isNaN(val1))
					val1 = 1;
				if (Math.isNaN(val2))
					val1 = 0.1;

				FlxTween.cancelTweensOf(holylight);
				FlxTween.tween(holylight, {alpha: val1}, val2, {ease: FlxEase.linear});
		}
	}
}

function onSongStart()
{
						if (titleCard != null)
						{
							FlxTween.tween(titleCard, {alpha: 1, 'scale.x': 1, 'scale.y': 1}, 3, {
								ease: FlxEase.cubeOut,
								onComplete: function(twn:FlxTween)
								{
									FlxTween.tween(titleCard, {alpha: 0}, 2, {
										ease: FlxEase.cubeOut,
										startDelay: 1,
										onComplete: function(twn:FlxTween)
										{
											remove(titleCard);
											titleCard.destroy();
										}
									});
								}
							});
						}
}


function onStepHit(){
				switch (curStep)
				{
					case 0:
						dad.visible = false;
					case 56:
						dad.visible = true;
					case 420:
						dad.visible = false;
						boyfriend.visible = false;
						gf.visible = false;
					case 436:
						dad.visible = true;
						boyfriend.visible = true;
						gf.visible = true;
					case 981:
						dad.visible = false;
					case 992:
						dad.visible = true;
					case 2817:
						dad.visible = false;
					case 2832:
						dad.visible = true;
						boyfriend.visible = false;
					case 2883:
						dad.visible = false;
				}
}