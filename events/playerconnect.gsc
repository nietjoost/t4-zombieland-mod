// Include
//#include maps/mp/gametypes/_spawnlogic;
#include scripts\mp\events\gamelogic;

// PLAYER connect functions
OnPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player.spawned = false;
        level.players++;

        player thread OnPlayerSpawned();                       
        level thread StartZombieLand();
    }
}

OnPlayerSpawned()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        if (self.spawned == false && level.started == false)
        {
            //self ChangeTeam("axis");
            return;
        }

        // FIRST spawn
        if (self.spawned == false)
        {
            self.spawned = true;
            self iprintlnbold("^5Welcome to ^2RooieRonnie's ^1ZombieLand^5!");
        }
    }
}