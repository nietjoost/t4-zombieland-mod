#include scripts\mp\hud\playermessage;
#include scripts\mp\events\gamelogic;
#include scripts\mp\utils\player;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\healthlogic;

// PLAYER connect functions
OnPlayerConnectZL()
{
    level endon ("stop_zombieland");

    for(;;)
    {
        level waittill("connected", player);

        // Set Player settings
        player.spawned = false;
        player.usingZipline = false;
        player.type = "human";
        player.money = level.humanStartMoney;
        player.nextPerk = 4;
        player.kills = 0;
        player.isInvisible = false;

        player thread OnPlayerSpawnedZL();

        level thread StartZombieLand();                
    }
}


// ON Player spawn logic
OnPlayerSpawnedZL()
{
    self endon ("disconnect");
    level endon ("stop_zombieland");
    
    for(;;)
    {
        self waittill("spawned_player");

        // If game is started -> zombie
        if (level.started == true && self.type == "human")
        {
            self.type = "zombie";
            self.money = level.zombieStartMoney;
            self ChangeTeam("axis");
        }

        // If game is started and zombie joins Humans -> zombie
        if (level.started == true && self.type == "zombie" && self.pers["team"] == "allies")
        {
            self.money = level.zombieStartMoney;
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

        // Player settings reset on spawn
        self.phealth = level.resetHealth;
        self.maxhealth = self.phealth;
        self.health = self.maxhealth;
        self.hint = "";
        self.subHint = "";

        // MENU logic
        self thread CreateMoneyHUD();
        self thread CreateHealthHUD();
        self thread WatchHealth();

        //PROMOD
        self setClientDvar("cg_fov", "95");
        self setClientDvar("cg_gun_x", "6");
        self setclientdvar("cg_fovmin", "1");
        self setClientDvar("cg_fovscale", "1.15");
    }
}