#include scripts\mp\hud\playermessage;
#include scripts\mp\events\playerconnect;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\player;

// Start the ZombieLand
StartZombieLand()
{
    // Check total players
    if (level.players.size < 2)
    {
        return;
    }

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
    }
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