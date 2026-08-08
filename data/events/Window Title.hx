import lime.app.Application;

function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Window Title':
			if (value2 == '')
			{
				Application.current.window.title = value1;
			}
			if (value2 == 'a')
			{
				Application.current.window.title = 'VS IMPOSTOR LEGACY ' + Main.LEGACY_VERSION;
			}
	}
}

function onEndSong()
{
	Application.current.window.title = 'VS IMPOSTOR LEGACY ' + Main.LEGACY_VERSION;
}

function onDestroy()
{
	Application.current.window.title = 'VS IMPOSTOR LEGACY ' + Main.LEGACY_VERSION;
}