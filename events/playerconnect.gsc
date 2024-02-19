#include scripts\mp\hud\playermessage;
#include scripts\mp\events\gamelogic;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\healthlogic;
#include scripts\mp\menu\menu;
#include scripts\mp\utils\player;

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
        player.moneyHudArray = [];
        player.moneyHudArrayCount = 0;
        player.nextPerk = 4;
        player.kills = 0;
        player.isInvisible = false;
        player.isInMegaZombie = false;
        player.tacticalSet = false;
        player.hasExplosiveSniper = false;
        player.buyWallWeapon = false;
        player.hasJetPack = false;
        player.moveSpeedScale = 1;

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
        self.menuAlive = true;
        
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
            self ResetMenu();
            self thread RunHumanShop();
            self PlayerSetupMenu();
        }
        else
        {
            wait 0.1;
            self thread GiveZombieClass();
            self thread WatchTactical();
            self thread ZombieNoBullets();
            self ResetMenu();
            self PlayerSetupMenu();
            self thread RunZombieShop();

            // Tactical Insertion
            if (self.tacticalSet == true)
            {
                self.tacticalSet = false;
                self SetOrigin(self.tacticalPos);
            }

            // Set Zombie
            if (level.buySlowerZombies == true)
            {
                self SetMoveSpeedScale(0.7);
            }
            else
            {
                self SetMoveSpeedScale(1);
            }
        }

        // Player settings reset on spawn
        self.phealth = level.resetHealth;
        self.maxhealth = self.phealth;
        self.health = self.maxhealth;
        self.hint = "";
        self.subHint = "";
        self.hasInstaKill = false;
        self.isInMegaZombie = false;
        self.isFlickering = false;

        // MENU logic
        self thread CreateMoneyHUD();
        self thread CreateHealthHUD();
        self thread WatchHealth();

        // PROMOD
        self setClientDvar("cg_fov", "95");
        self setClientDvar("cg_gun_x", "6");
        self setclientdvar("cg_fovmin", "1");
        self setClientDvar("cg_fovscale", "1.15");
    }
}