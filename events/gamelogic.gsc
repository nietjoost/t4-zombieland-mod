#include scripts\mp\hud\playermessage;
#include scripts\mp\events\playerconnect;
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
    allplayermessagemiddle("^1Choosing zombies in 20 seconds!");
    wait 10;
    allplayermessagemiddle("^1Choosing zombies in 10 seconds!");
    wait 5;
    allplayermessagemiddle("^15");
    wait 1;
    allplayermessagemiddle("^14");
    wait 1;
    allplayermessagemiddle("^13");
    wait 1;
    allplayermessagemiddle("^12");
    wait 1;
    allplayermessagemiddle("^11");

    if (level.players.size < 2)
    {
        level.enoughPlayers = false;
        allplayermessagemiddle("^1There are not enough players!");
        allplayermessagemiddle("^5Waiting for more players!");
        return;
    }

    // Pick zombie logic
    wait 1;
    level.started = true;
    level.enoughPlayers = true;
    allplayermessagemiddle("^5The zombies are coming!");
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