var monika:FlxSprite;
var sayori:FlxSprite;
var natsuki:FlxSprite;
var yuri:FlxSprite;

function onLoad()
{
	var clubmainlight = new BGSprite('clubroom/clublights', -700, -520, 1, 1);
	clubmainlight.setGraphicSize(Std.int(clubmainlight.width * 1.6));
	clubmainlight.updateHitbox();
	clubmainlight.blend = BlendMode.SCREEN;
	clubmainlight.zIndex = 301;
	add(clubmainlight);

	var deskfront = new BGSprite('clubroom/DesksFront', -700, -520, 1.3, 1);
	deskfront.setGraphicSize(Std.int(deskfront.width * 1.6));
	deskfront.updateHitbox();
	deskfront.zIndex = 302;
	add(deskfront);

	var closet = new BGSprite('clubroom/DDLCfarbg', -700, -520, 0.9, 1);
	closet.setGraphicSize(Std.int(closet.width * 1.6));
	closet.updateHitbox();
	add(closet);

	var clubroom = new BGSprite('clubroom/DDLCbg', -700, -520, 1, 1);
	clubroom.setGraphicSize(Std.int(clubroom.width * 1.6));
	clubroom.updateHitbox();
	add(clubroom);
}

function onCreatePost(){
			monika = new FlxSprite(320, 173);
			monika.frames = Paths.getSparrowAtlas('bgdoki/monika');
			monika.animation.addByPrefix('idle', 'Moni BG', 24, false);
			monika.setGraphicSize(Std.int(monika.width * 0.7));
			monika.updateHitbox();
			monika.scrollFactor.set(1,0.9);
			monika.zIndex = 1;

			sayori = new FlxSprite(-49, 247);
			sayori.frames = Paths.getSparrowAtlas('bgdoki/sayori');
			sayori.animation.addByPrefix('idle', 'Sayori BG', 24, false);
			sayori.setGraphicSize(Std.int(sayori.width * 0.7));
			sayori.scrollFactor.set(1,0.9);
			sayori.updateHitbox();
			sayori.zIndex = 1;

			natsuki = new FlxSprite(1047, 303);
			natsuki.frames = Paths.getSparrowAtlas('bgdoki/natsuki');
			natsuki.animation.addByPrefix('idle', 'Natsu BG', 24, false);
			natsuki.scrollFactor.set(1,0.9);
			natsuki.setGraphicSize(Std.int(natsuki.width * 0.7));
			natsuki.updateHitbox();
			natsuki.zIndex = 1;

			protag = new BGSprite('bgdoki/protag', 150, 152, 1, 0.9, ['idle', 'Protag-kun BG']);
			protag.setGraphicSize(Std.int(protag.width * 0.7));
			protag.updateHitbox();

			yuri = new FlxSprite(1247, 178);
			yuri.frames = Paths.getSparrowAtlas('bgdoki/yuri');
			yuri.animation.addByPrefix('idle', 'Yuri BG', 24, false);
			yuri.scrollFactor.set(1,0.9);
			yuri.setGraphicSize(Std.int(yuri.width * 0.7));
			yuri.updateHitbox();
			yuri.zIndex = 1;

		if (PlayState.SONG.player2 == "sayori"){
			add(natsuki);
			add(yuri);
			yuri.x = sayori.x;
		}
		if (PlayState.SONG.player2 == "natsuki"){
			add(sayori);
			add(yuri);
			yuri.x = natsuki.x;
		}
		if (PlayState.SONG.song == "Deep Breaths"){
			add(sayori);
			add(natsuki);
		}
		camSpecialThing([475, 400], [850, 500], 0.75);
}

function onBeatHit(){
		monika.animation.play('idle');
		sayori.animation.play('idle');
		natsuki.animation.play('idle');
		yuri.animation.play('idle');
}