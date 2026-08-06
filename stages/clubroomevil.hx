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