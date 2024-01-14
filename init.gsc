// Includes
#include scripts\mp\utils\clock;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\settings;
#include scripts\mp\utils\weaponsettings;
#include scripts\mp\maps\mapedits;
#include scripts\mp\menu\menu;
#include scripts\mp\events\broadcaster;
#include scripts\mp\events\playerkilled;
#include scripts\mp\events\playerconnect;
#include scripts\mp\events\playerconnecterror;
#include scripts\mp\events\randomdroplogic;
#include scripts\mp\events\megazombie;

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
    level.onForfeit = ::FixForfeit;

    // ZombieLand scripts
    level thread SetupSettings();
    level thread GlobalSetting();
    level thread SetupWeaponSettings();
    level thread SetupPerkSettings();
    level thread PreCache();
    level thread OnPlayerConnectZL();
    level thread StartMenu();

    wait 2;
    level thread LoadMap();

    wait 2;
    level thread WatchZombieBoss();
    level thread Broadcast();
    level thread WatchRandomDrop();

    wait 1;
    level thread CalculateGameTimeEndGame();

    // DEBUG
    //level thread debug();
}

debug()
{
    level endon ("stop_zombieland");
    wait 2;

    for(;;)
	{
        //DEBUG
        wait 3;
        level.players[0] iPrintln(level.players[0].origin);
	}
}