#include scripts\mp\hud\playermessage;
#include scripts\mp\events\playerconnect;
#include scripts\mp\events\botlogic;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\player;

// Start the ZombieLand
StartZombieLand()
{
    //Check for bots
    level thread BotLogic();
    
    // Stop logic when another player joins
    if (level.enoughPlayers == true)
    {
        return;
    }
    level.enoughPlayers = true;

    //Start the zombie choose logic
    wait 10;
    AllPlayerMessageMiddle("^1Choosing zombies in 20 seconds!");
    wait 10;
    AllPlayerMessageMiddle("^1Choosing zombies in 10 seconds!");
    wait 5;
    AllPlayerMessageMiddle("^15");
    wait 1;
    AllPlayerMessageMiddle("^14");
    wait 1;
    AllPlayerMessageMiddle("^13");
    wait 1;
    AllPlayerMessageMiddle("^12");
    wait 1;
    AllPlayerMessageMiddle("^11");
    
    // Check for running mod
	if (level.stopZombieLand)
		return;

    if (level.players.size < 2)
    {
        level.enoughPlayers = false;
        AllPlayerMessageMiddle("^1There are not enough players!");
        AllPlayerMessageMiddle("^5Waiting for more players!");
        return;
    }

    // Pick zombie logic
    wait 1;
    level.started = true;
    level.enoughPlayers = true;
    AllPlayerMessageMiddle("^5The zombies are coming!");
    level thread PickZombies();
}

PickZombies()
{
    if (level.players.size > 8)
    {
        level.zombie1 = "";
        level.zombie2 = "";
        while(level.zombie1 == level.zombie2)
        {
            level.zombie1 = level.players[RandomIntRange(0, level.players.size)];
            level.zombie2 = level.players[RandomIntRange(0, level.players.size)];
            level.zombie1 thread ChangeTeam("axis");
            level.zombie2 thread ChangeTeam("axis");
        } 
        return;
    }

   // Chose only one infected
   level.zombie1 = level.players[RandomIntRange(0, level.players.size)];
   level.zombie1 thread ChangeTeam("axis");
}

// END LOGIC
CheckEnd()
{
    if (level.started == true && CalculateTotalHumans() == 0)
    {
        // Check for already triggerd
        if (level.ended == true)
        {
            return;
        }

        level.ended = true;

        AllPlayerMessageMiddle("^2The ^1Zombies ^2has won!");

        for ( i = 0; i < level.players.size; i++ )
        {	
            p = level.players[i];
            p FreezeControls(true);
        }

        wait 5;

        level thread ChooseRandomMap();
    }
}

ChooseRandomMap()
{
    // level.maps = [];
    // level.maps[0] = "mp_airfield";
    // level.maps[1] = "mp_suburban";
    // level.maps[2] = "mp_asylum";
    // level.maps[3] = "mp_kwai";
    // level.maps[4] = "mp_drum";
    // level.maps[5] = "mp_bgate";
    // level.maps[6] = "mp_castle";
    // level.maps[7] = "mp_shrine";
    // level.maps[8] = "mp_stalingrad";
    // level.maps[9] = "mp_courtyard";
    // level.maps[10] = "mp_dome";
    // level.maps[11] = "mp_downfall";
    // level.maps[12] = "mp_hangar";
    // level.maps[13] = "mp_kneedeep";
    // level.maps[14] = "mp_makin";
    // level.maps[15] = "mp_makin_day";
    // level.maps[16] = "mp_nachtfeuer";
    // level.maps[17] = "mp_outskirts";
    // level.maps[18] = "mp_vodka";
    // level.maps[19] = "mp_roundhouse";
    // level.maps[20] = "mp_seelow";
    // level.maps[21] = "mp_subway";
    // level.maps[22] = "mp_docks";
    // map = level.maps[RandomIntRange(0, level.maps.size)];
    // map(map, true);

    level thread maps\mp\gametypes\_globallogic::forceend();
}

CalculateTotalHumans()
{
    humanCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {	
        p = level.players[i];
        if (p.pers["team"] == "allies")
        {
            humanCount++;
        }
    }

    return humanCount;
}

BotLogic()
{
    wait 10;

    // Check total players
    if (level.players.size < 2)
    {
        wait 10;
        level thread AddTestClients(5);
        AllPlayerMessageMiddle("^6Adding bots because there are not enough people!");
        return;
    }
}