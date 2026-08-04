var bgGirls:FlxSprite;

var tablet:FunkinSprite;
var medbay:FunkinSprite;

var hologramShader:FunkinRuntimeShader;
var screenShader:FunkinRuntimeShader;
var petScreenShader:FunkinRuntimeShader;

function onLoad()
{
	GameOverSubstate.deathSoundName = 'fnf_loss_sfx-pixel';
	GameOverSubstate.loopSoundName = 'gameOver-pixel';
	GameOverSubstate.endSoundName = 'gameOverEnd-pixel';
	GameOverSubstate.characterName = 'bf-pixel-dead';
	FlxG.camera.pixelPerfectRender = true;
	
	var bgSky:BGSprite = new BGSprite('backgrounds/weeb/weebSky', 0, 0, 0.1, 0.1);
	add(bgSky);
	bgSky.antialiasing = false;
	
	var repositionShit = -200;
	
	var bgSchool:BGSprite = new BGSprite('backgrounds/weeb/weebSchool', repositionShit, 0, 0.6, 0.90);
	add(bgSchool);
	bgSchool.antialiasing = false;
	
	var bgStreet:BGSprite = new BGSprite('backgrounds/weeb/weebStreet', repositionShit, 0, 0.95, 0.95);
	add(bgStreet);
	bgStreet.antialiasing = false;
	
	var widShit = Std.int(bgSky.width * 6);
	if (!ClientPrefs.lowQuality)
	{
		var fgTrees:BGSprite = new BGSprite('backgrounds/weeb/weebTreesBack', repositionShit + 170, 130, 0.9, 0.9);
		fgTrees.setGraphicSize(Std.int(widShit * 0.8));
		fgTrees.updateHitbox();
		add(fgTrees);
		fgTrees.antialiasing = false;
	}
	
	var bgTrees:FlxSprite = new FlxSprite(repositionShit - 380, -800);
	bgTrees.frames = Paths.getPackerAtlas('backgrounds/weeb/weebTrees');
	bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
	bgTrees.animation.play('treeLoop');
	bgTrees.scrollFactor.set(0.85, 0.85);
	add(bgTrees);
	bgTrees.antialiasing = false;

	bgGirls = new FlxSprite(-100, 190);
	bgGirls.frames = Paths.getSparrowAtlas('backgrounds/weeb/bgFreaks');
	bgGirls.animation.addByPrefix('idle', 'BG fangirls dissuaded', 24, false);
	bgGirls.scale.set(6, 6);
	bgGirls.updateHitbox();
	bgGirls.scrollFactor.set(0.9, 0.9);
	bgGirls.antialiasing = false;

	medbay = new FunkinSprite(802, 475).loadAtlas('characters/freeplay/medbay');
	medbay.addAnimByPrefix('idle', 'medbay', 24, false);
	medbay.playAnim('idle');
	medbay.antialiasing = false;
	medbay.setGraphicSize(Std.int(medbay.width * 6));
	medbay.updateHitbox();
	medbay.zIndex = 8;
	
	tablet = new FunkinSprite(278, 450).loadAtlas('characters/freeplay/tablet');
	tablet.addAnimByPrefix('idle', 'anim', 12, true);
	tablet.playAnim('idle');
	tablet.antialiasing = false;
	tablet.setGraphicSize(Std.int(tablet.width * 6));
	tablet.updateHitbox();
	tablet.zIndex = 2;
	
	if (!ClientPrefs.lowQuality)
	{
		var treeLeaves:BGSprite = new BGSprite('backgrounds/weeb/petals', repositionShit, -40, 0.85, 0.85, ['PETALS ALL'], true);
		treeLeaves.setGraphicSize(widShit);
		treeLeaves.updateHitbox();
		add(treeLeaves);
		treeLeaves.antialiasing = false;
	}
	
	bgSky.setGraphicSize(widShit);
	bgSchool.setGraphicSize(widShit);
	bgStreet.setGraphicSize(widShit);
	bgTrees.setGraphicSize(Std.int(widShit * 1.4));
	
	bgSky.updateHitbox();
	bgSchool.updateHitbox();
	bgStreet.updateHitbox();
	bgTrees.updateHitbox();
}

function onBeatHit()
{
	if (curBeat % 2 == 0) medbay.playAnim('idle', true);

	bgGirls.animation.play('idle');
}

function onCountdownTick(tick:Int):Void
{
	if (tick % 2 == 0) medbay.playAnim('idle', true);

	bgGirls.animation.play('idle');
}

function onCreatePost(){
	camSpecialThing([545, 500], [850, 600], 1.05);
	
	if (dad.curCharacter == "duetnew")
	{
		add(bgGirls);
	}

	if (boyfriend.curCharacter != "pixelbf-new")
	{
		hologramShader = newShader('stages/hologram');
		iconShader = newShader('stages/hologram');
		hologramShader.setFloat('phase', 0);
		iconShader.setFloat('phase', 0);
		
		add(medbay);
	}
	
	if (gf.curCharacter != "gf-pixelddto")
	{
		screenShader = newShader('stages/screen');
		petScreenShader = newShader('stages/screen');
		
		add(tablet);
	}
	
	repositionPlayerHologram();
	repositionSpeakerHologram();
	
	for (character in [boyfriend, dad, gf])
	{
		character.setPosition(Math.round(character.x), Math.round(character.y));
		
		if (character.legacyOffset)
		{
			character.origin.set(Math.round(character.origin.x), Math.round(character.origin.y)); // fuck you ! fuck you ! fuck y
			character.offset.set(Math.round(character.offset.x / 6) * 6, Math.round(character.offset.y / 6) * 6);
		}
	}
}

public function repositionPlayerHologram():Void
{
	if (boyfriend.curCharacter != "pixelbf-new")
	{
		var idleOffset = (boyfriend.animOffsets.get('idle') ?? boyfriend.animOffsets.get('danceLeft') ?? [0, 0]).copy();
		pixelateOffsets(boyfriend, idleOffset, .75);
		
		boyfriend.shader = hologramShader;
		boyfriend.shader = hologramShader;
		iconP1.shader = iconShader;
		iconShader.setFloat('block', 6 / boyfriend.scale.x);
		boyfriend.scalableOffsets = false;
		boyfriend.scale.set(boyfriend.scale.x * .75, boyfriend.scale.y * .75);
		boyfriend.updateHitbox();
		boyfriend.setPosition(Math.round((boyfriend.x - idleOffset[0] - 60) * 6) / 6 - 1,
			Math.round((boyfriend.y + boyfriend.height * .125 /*my unparalleled genius*/ - idleOffset[1] - 100) * 6) / 6 - 1);
		boyfriend.useRenderTexture = true;
		
		boyfriend.playAnim(boyfriend.getAnimName(), true);
		
		hologramShader.setFloat('block', 6 / boyfriend.scale.x);
	}
}

public function repositionSpeakerHologram():Void
{
	if (gf.curCharacter != "gf-pixelddto")
	{
		final gfRatio:Float = Math.min(290 / gf.frameWidth, 240 / gf.frameHeight);
		
		var idleOffset = (gf.animOffsets.get('idle') ?? gf.animOffsets.get('danceLeft') ?? [0, 0]).copy();
		pixelateOffsets(gf, idleOffset, gfRatio);
		
		screenShader.setFloat('block', 6 / gfRatio);
		
		gf.shader = screenShader;
		gf.useRenderTexture = true;
		gf.scale.set(gfRatio, gfRatio);
		gf.legacyOffset = false;
		gf.updateHitbox();
		gf.setPosition(
			Math.round((tablet.x + (tablet.width - 120 - gf.width) * .5) / 6) * 6,
			Math.round((tablet.y + (tablet.height - 12 - gf.height) * .5) / 6) * 6
		);
		
		gf.playAnim(gf.getAnimName(), true);
		
		if (PlayState.prevCamFollow == null) // ok
		{
			camFollow.setPosition(
				gf.getGraphicMidpoint().x + gf.cameraPosition[0] + girlfriendCameraOffset[0],
				gf.getGraphicMidpoint().y + gf.cameraPosition[1] + girlfriendCameraOffset[1]
			);
			FlxG.camera.snapToTarget();
		}
		
		if (pet.getFlag('isPixel') != true)
		{
			var idleOffset = (pet.animOffsets.get('idle') ?? pet.animOffsets.get('danceLeft') ?? [0, 0]).copy();
			pixelateOffsets(pet, idleOffset, pet.scale.y * gfRatio);
			
			petScreenShader.setFloat('block', 6 / pet.scale.y / gfRatio);
			
			pet.shader = petScreenShader;
			pet.useRenderTexture = true;
			pet.antialiasing = false;
			pet.scale.set(pet.scale.x * gfRatio, pet.scale.y * gfRatio);
			pet.updateHitbox();
			pet.setPosition(
				Math.round(Math.min(gf.x + gf.width - 20, tablet.x + tablet.width - 460 - pet.width) / 6) * 6,
				Math.round((gf.y + gf.height - pet.height + 4) / 6) * 6
			);
			pet.zIndex = gf.zIndex + 3;
		}
	}
	else
	{
		pet.kill();
	}
}

function pixelateOffsets(character:Character, idleOffset:Array<Float>, targetScale:Float)
{
	for (offset in character.animOffsets)
	{
		offset[0] -= idleOffset[0];
		offset[1] -= idleOffset[1];
		
		offset[0] = (Math.round(offset[0] / (character.scalableOffsets ? character.scale.x : 1) * targetScale * 6) / 6);
		offset[1] = (Math.round(offset[1] / (character.scalableOffsets ? character.scale.y : 1) * targetScale * 6) / 6);
	}
}

function onUpdate(elapsed:Float)
{
	if (hologramShader != null)
	{
		hologramShader.data.phase.value[0] += elapsed;
		hologramShader.setFloat('rand', FlxG.random.float(-1, 1));
	}
}
