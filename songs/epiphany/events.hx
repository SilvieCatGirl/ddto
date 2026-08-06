var space:FlxBackdrop;
var bg:BGSprite;
var fg:BGSprite;
var clouds:FlxBackdrop;
var fancyclouds:FlxBackdrop;
var windowlight:BGSprite;
var lightontopofall:BGSprite;
var popup:BGSprite;

function onLoad(){
					popup = new FlxSprite(312, 432);
					popup.frames = Paths.getSparrowAtlas('bigmonika/bigika_delete');
					popup.animation.addByPrefix('idle', "PopUpAnim", 24, false);
					popup.animation.play('idle', true);
					popup.scrollFactor.set(1, 1);
					popup.alpha = 0.0000001;
					add(popup);
}

function onBeatHit(){
			{
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
						game.camGame.fade(FlxColor.BLACK, 0.7 / Conductor.playbackSpeed, false);
				}
			}
}