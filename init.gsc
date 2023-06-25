// Includes
#include scripts\mp\utils\utils;
#include scripts\mp\utils\settings;
#include scripts\mp\utils\hostscripts;
#include scripts\mp\maps\mapedits;
#include scripts\mp\menu\menu;
#include scripts\mp\events\playerkilled;
#include scripts\mp\events\playerconnect;
#include scripts\mp\events\playerconnecterror;

// Main script
init()
{
    level.prefix = "^1[ZombieLand]^7 ";

    // Check server settings
    if (GetDvar("g_gametype") != "tdm")
    {
        level thread OnPlayerConnectError();
        return;
    }

    // Replace functions
    level.onPlayerKilled = ::OnPlayerKilled;

    // ZombieLand scripts
    level thread SetupSettings();
    level thread GlobalSetting();
    level thread PreCache();
    level thread OnPlayerConnect();
    level thread LoadMap();

    level thread StartMenu();

    for(;;)
	{
        level.prematchPeriod = 0;
		wait 1;
		level.onForfeit = ::FixForfeit;

        //DEBUG
        wait 5;
        for ( i = 0; i < level.players.size; i++ )
        {	
            p = level.players[i];
            p iPrintln(p.origin);
        }
	}
}