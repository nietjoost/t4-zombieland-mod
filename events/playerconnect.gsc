#include scripts\mp\hud\playermessage;
#include scripts\mp\events\gamelogic;
#include scripts\mp\utils\player;
#include scripts\mp\hud\moneylogic;

// PLAYER connect functions
OnPlayerConnectZL()
{
    for(;;)
    {
        level waittill("connected", player);

        player.spawned = false;
        player.usingZipline = false;
        player.type = "human";
        player.money = 500;
        player thread OnPlayerSpawnedZL();

        level thread StartZombieLand();                
    }
}


// ON Player spawn logic
OnPlayerSpawnedZL()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        // If game is started -> zombie
        if (self.spawned == true && level.started == true && self.type == "human")
        {
            self.type = "zombie";
            self ChangeTeam("axis");
        }

        // If game is not started -> human
        if (self.spawned == false && level.started == false)
        {
            if (self.pers["team"] == "axis")
            {
                self.type = "human";
                self ChangeTeam("allies");
                continue;
            }
        }

        // Messages connect and logic
        if (self.spawned == false)
        {
            self.spawned = true;
            self thread PlayerMessageMiddle("^5Welcome to ^2RooieRonnie's ^1ZombieLand^5!");

            if (self.type == "human")
            {
                self thread PlayerMessageMiddle("^3You are a Human! ^5Survive the ^1zombies ^5to win!");
            }
            else
            {
                self thread PlayerMessageMiddle("^1You are a zombie now!");
            }
        }

        // Loadout logic
        if (self.type == "human")
        {
            self thread GivePlayerClass();
            //self thread maps\mp\gametypes\_hud_message::oldNotifyMessage("Welcome " + self.name + "!", "To RooieRonnie's Zombieland", "hud_icon_ppsh", (1, 0, (55 / 255)), "mp_level_up", 5);
        }
        else
        {
            self thread GiveZombieClass();
        }

        // MENU logic
        self thread CreateMoneyHUD();
    }
}