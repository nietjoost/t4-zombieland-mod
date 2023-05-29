#include scripts\mp\hud\playermessage;

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

}