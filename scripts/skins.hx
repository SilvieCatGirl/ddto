import funkin.Mods;
if (Mods.currentModDirectory != 'ddto') return;

function onCreatePost()
{
// thank you ashley for this <3
	var sayoriSkin:Null<String> = ClientPrefs.equipment.get('sayoriSkin');
	
	if (PlayState.SONG.player2 == "sayori" && sayoriSkin != null) changeCharacter(sayoriSkin, 1);
}
