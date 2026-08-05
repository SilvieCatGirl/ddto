var bg2:BGSprite;
var fg:BGSprite;
var space:FlxBackdrop;

function onLoad()
{
	var posX = 400;
	var posY = 300;

	var bg:BGSprite = new BGSprite('backgrounds/weeb/animatedEvilSchool', posX, posY, 0.8, 0.9, ['background 2'], true);
	bg.scale.set(6, 6);
	bg.antialiasing = false;
	add(bg);

	space = new FlxBackdrop(Paths.image('backgrounds/weeb/FinaleBG_1'));
	space.scrollFactor.set(0.1, 0.1);
	space.velocity.set(-10, 0);
	space.scale.set(1.65, 1.65);
	space.alpha = 0.000001;
	add(space);

	bg2 = new BGSprite('backgrounds/weeb/FinaleBG_2', 100, 200, 0.4, 0.6);
	bg2.scale.set(2.3, 2.3);
	bg2.antialiasing = false;
	bg2.alpha = 0.000001;
	add(bg2);

	fg = new BGSprite('backgrounds/weeb/FinaleFG', 50, 200, 1, 1);
	fg.scale.set(1.5, 1.5);
	fg.antialiasing = false;
	fg.alpha = 0.000001;
	add(fg);
		
	medbay = new FunkinSprite(752, 575).loadAtlas('characters/freeplay/medbay');
	medbay.addAnimByPrefix('idle', 'medbay', 24, false);
	medbay.playAnim('idle');
	medbay.antialiasing = false;
	medbay.setGraphicSize(Std.int(medbay.width * 6));
	medbay.updateHitbox();
	medbay.zIndex = 8;
	
	tablet = new FunkinSprite(278, 550).loadAtlas('characters/freeplay/tablet');
	tablet.addAnimByPrefix('idle', 'anim', 12, true);
	tablet.playAnim('idle');
	tablet.antialiasing = false;
	tablet.setGraphicSize(Std.int(tablet.width * 6));
	tablet.updateHitbox();
	tablet.zIndex = 2;
}

function onBeatHit()
{
	if (curBeat % 2 == 0) medbay.playAnim('idle', true);
}

function onCountdownTick(tick:Int):Void
{
	if (tick % 2 == 0) medbay.playAnim('idle', true);
}

function onCreatePost(){
	PlayState.instance.triggerEventNote("Alt Idle Animation", "dad", "-alt");
	camSpecialThing([545, 600], [850, 675], 1.05);

	if (boyfriend.curCharacter != "pixelbfangry-new")
	{
		hologramShader = newShader('stages/hologram');
		iconShader = newShader('stages/hologram');
		hologramShader.setFloat('phase', 0);
		iconShader.setFloat('phase', 0);
		
		add(medbay);
	}
	
	repositionPlayerHologram();
	
	for (character in [boyfriend, dad])
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
	if (boyfriend.curCharacter != "pixelbfangry-new")
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
	if (boyfriend.curCharacter != "pixelbfangry-new")
	{
		hologramShader.data.phase.value[0] += elapsed;
		hologramShader.setFloat('rand', FlxG.random.float(-1, 1));
	}
}

function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Demise Switch':
			if (value1 == '1')
			{
				space.alpha = 1;
				bg2.alpha = 1;
				fg.alpha = 1;
			}
			if (value1 == '0')
			{
				space.alpha = 0.000001;
				bg2.alpha = 0.000001;
				fg.alpha = 0.000001;
			}
			if (value1 == '2')
			{
				camGame.alpha = 0.000001;
			}
			if (value1 == '3')
			{
				camGame.alpha = 1;
			}
	}
}

