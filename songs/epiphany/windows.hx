import lime.app.Application;

var winX:Float = 0;
var winY:Float = 0;

var strong:Float = 15;

function opponentNoteHit(note:Note)
{
    stufShit(Std.int(Math.abs(note.noteData)));
}

function onUpdatePost(elapsed:Float) {

    Application.current.window.y = winY;
    Application.current.window.x = winX;

    winX = FlxMath.lerp(winX, 340, .2/(ClientPrefs.framerate / 60));
    winY = FlxMath.lerp(winY, 180, .2/(ClientPrefs.framerate / 60));
}
function stufShit(noteType:Int) {
    switch(noteType){
        case 3:

            winX += strong;
        case 2:
            winY -= strong;

        case 1:
            winY += strong;

        case 0:
            winX -= strong;
    }
}