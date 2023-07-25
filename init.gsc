// Includes
#include scripts\mp\utils\utils;
#include scripts\mp\utils\settings;
#include scripts\mp\utils\hostscripts;
#include scripts\mp\utils\weaponsettings;
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
    level thread SetupWeaponSettings();
    level thread SetupPerkSettings();
    level thread PreCache();
    level thread OnPlayerConnectZL();
    level thread LoadMap();

    level thread StartMenu();

    for(;;)
	{
        level endon("stop_zombieland");

        level.prematchPeriod = 0;
        wait 1;
        level.onForfeit = ::FixForfeit;

        //DEBUG
        wait 3;
        level.players[0] iPrintln(level.players[0].origin);
	}
}