var space:FlxBackdrop;
var bg:BGSprite;
var fg:BGSprite;
var clouds:FlxBackdrop;
var fancyclouds:FlxBackdrop;
var windowlight:BGSprite;
var lightontopofall:BGSprite;
var popup:BGSprite;

function onLoad()
{
					space = new FlxBackdrop(Paths.image('bigmonika/Sky'));
					space.scrollFactor.set(0.1, 0.1);
					space.velocity.set(-7, 0);
					space.scale.set(0.7, 0.7);
					add(space);

						clouds = new FlxBackdrop(Paths.image('bigmonika/Clouds'));
						clouds.scrollFactor.set(0.1, 0.1);
						clouds.velocity.set(-13, 0);
						clouds.scale.set(0.7, 0.7);
						add(clouds);

						fancyclouds = new FlxBackdrop(Paths.image('bigmonika/mask'));
						fancyclouds.scrollFactor.set(0.1, 0.1);
						fancyclouds.velocity.set(-13, 0);
						fancyclouds.scale.set(0.7, 0.7);
						fancyclouds.alpha = 1;
						add(fancyclouds);

					var bg:BGSprite = new BGSprite('bigmonika/BG', -250, -167, 0.4, 0.6);
					add(bg);

						windowlight = new BGSprite('bigmonika/WindowLight', -250, -167, 0.4, 0.6);
						add(windowlight);
	
						lightontopofall = new BGSprite('bigmonika/lights', -250, -167, 0.4, 0.6);
						lightontopofall.blend = BlendMode.SCREEN;

					var fg:BGSprite = new BGSprite('bigmonika/FG', -328, -115);
					add(fg);

					popup = new FlxSprite(312, 432);
					popup.frames = Paths.getSparrowAtlas('bigmonika/bigika_delete', true);
					popup.animation.addByPrefix('idle', "PopUpAnim", 24, false);
					popup.animation.play('idle', true);
					popup.scrollFactor.set(1, 1);
					popup.alpha = 0.001;
}

function onCreatePost()
{
	game.boyfriend.visible = false;
	camSpecialThing([600, 275], [600, 275], 0.8);
}

function onBeatHit(){
				switch (curBeat)
				{
					case 1:
						camZooming = true;
					case 4:
						FlxTween.tween(FlxG.camera, {zoom: 0.94}, 2.5, {
							ease: FlxEase.sineOut,
							onComplete: function(tween:FlxTween)
							{
								defaultCamZoom = 0.9;
							}
						});
					case 72:
						FlxTween.tween(FlxG.camera, {zoom: 0.8}, 2.5, {
							ease: FlxEase.sineOut,
							onComplete: function(tween:FlxTween)
							{
								defaultCamZoom = 0.8;
							}
						});
					case 580:
						FlxTween.tween(FlxG.camera, {zoom: 1}, 2.5, {
							ease: FlxEase.sineOut,
							onComplete: function(tween:FlxTween)
							{
								defaultCamZoom = 1.1;
							}
						});
					case 648:
						FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2.5, {
							ease: FlxEase.sineOut,
							onComplete: function(tween:FlxTween)
							{
								defaultCamZoom = 0.9;
							}
						});

						popup.alpha = 1;
						popup.animation.play('idle', true);
					case 776:
						dad.playAnim('lastNOTE_start');
						dad.specialAnim = true;
					case 780:
						dad.playAnim('lastNOTE_end');
						dad.specialAnim = true;
					case 788:
						FlxTween.tween(playHUD.iconP2, {alpha: 0}, 0.25, {ease: FlxEase.sineOut});
						game.dad.y = 10000;
					case 790:
						game.camGame.fade(FlxColor.BLACK, 0.7, false);
				}
}