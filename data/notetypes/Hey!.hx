function setupNote(note)
{
    if (note.noteType == 'Hey!'){
		if (!PlayState.isPixelStage){
			note.reloadNote('markov/', 'NOTE_assets');
		}
		if (PlayState.isPixelStage){
			note.setCustomColor([0xFF101010, 0xFFFF0000, 0xFF990022]);
		}
		note.noAnimation = true;
		if (PlayState.SONG.song == "Obsession"){
			note.noAnimation = false;
		}
		note.ignoreNote = false;
		note.canMiss = true;
		note.hitPriority = 0;
		note.rgbEnabled = false;
		note.hitCausesMiss = true;
		note.missHealth = 5;
	}
}

function postSpawnNote(note)
{
	if (note.noteType == 'Hey!')
	{
		if (!PlayState.isPixelStage){
			note.rgbEnabled = false;
		}
	}
}