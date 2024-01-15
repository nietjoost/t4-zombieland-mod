#include scripts\mp\hud\playermessage;
#include scripts\mp\events\playerconnect;
#include scripts\mp\events\botlogic;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\player;
#include scripts\mp\utils\clock;

// Start the ZombieLand
StartZombieLand()
{
    //Check for bots
    level thread SpawnBot();

    // Stop logic when another player joins
    if (level.enoughPlayers == true)
    {
        return;
    }
    level.enoughPlayers = true;

    //Start the zombie choose logic
    wait level.preLobbyTimer;
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
	if (level.stopZombieLand == true)
	{
		return;
	}

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
    level thread CalculateGameTime();
    level thread PickZombies();
}

PickZombies()
{
    if (level.players.size > 6)
    {
        level.zombie1 = "";
        level.zombie2 = "";
        while(level.zombie1 == level.zombie2 && (level.zombie1 == level.players[0] || level.zombie2 == level.players[0]))
        {
            level.zombie1 = level.players[RandomIntRange(0, level.players.size)];
            level.zombie2 = level.players[RandomIntRange(0, level.players.size)];
        }

        level.zombie1 thread ChangeTeam("axis");
        level.zombie2 thread ChangeTeam("axis");
        return;
    }

    // Chose only one infected
    while(level.zombie1 == level.players[0])
    {
        level.zombie1 = level.players[RandomIntRange(0, level.players.size)];
    }
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
        level notify("game_ended");

        // Messages and player utils
        AllPlayerTypeWriterText("^2The ^1Zombies ^2have won!");

        level thread EndGameLogic();
    }
}

EndGameLogic()
{
    VisionSetNaked("mpOutro", 2.0);
    wait 1;
    AllPlayerMessageMiddle("^2Player ^7" + GetPlayerWithMostKills().name + " ^2had the most kills!");
    AllPlayerMessageMiddle("^5The Humans Survived: ^7"+ level.minutes +" ^5mins and ^7"+ level.seconds +" ^5secs.");
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        p FreezeControls(true);
        p PlaySound("mp_defeat");
    }
    wait 10;

    level thread ChooseRandomMap();
}

ChooseRandomMap()
{
    level thread maps\mp\gametypes\_globallogic::forceend();
}


// Gamelogic Utils
SpawnBot()
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