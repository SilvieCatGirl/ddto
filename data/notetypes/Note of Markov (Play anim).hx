function setupNote(note)
{
    if (note.noteType == 'Note of Markov (Play anim)'){
		note.reloadNote('markov/', 'NOTE_assets');
		note.noAnimation = false;
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
	if (note.noteType == 'Note of Markov (Play anim)')
	{
		if (!PlayState.isPixelStage){
			note.rgbEnabled = false;
		}
	}
}