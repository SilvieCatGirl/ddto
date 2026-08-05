import funkin.Mods;
if (Mods.currentModDirectory != 'ddto-main') return;

function onCreatePost()
{
// thank you ashley for this <3
	var sayoriSkin:Null<String> = ClientPrefs.equipment.get('sayoriSkin');
	var natsukiSkin:Null<String> = ClientPrefs.equipment.get('natsukiSkin');
	var monikaSkin:Null<String> = ClientPrefs.equipment.get('monikaSkin');
	var yuriSkin:Null<String> = ClientPrefs.equipment.get('yuriSkin');
	
	if (PlayState.SONG.player2 == "sayori" && sayoriSkin != null) changeCharacter(sayoriSkin, 1);
	if (PlayState.SONG.player2 == "natsuki" && natsukiSkin != null) changeCharacter(natsukiSkin, 1);
}
