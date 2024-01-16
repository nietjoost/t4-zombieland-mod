#include scripts\mp\menu\menu;
#include scripts\mp\hud\healthlogic;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\playermessage;
#include scripts\mp\utils\utils;

// Classes
GivePlayerClass()
{
    self clearPerks();
    self takeAllWeapons();
    self giveWeapon(level.playerStartWeapon);
    self giveMaxAmmo(level.playerStartWeapon);
    self switchToWeapon(level.playerStartWeapon);

    self giveWeapon(level.zombieStartWeapon);
    self giveMaxAmmo(level.zombieStartWeapon);

    self FreezeControls(false);
}


GiveZombieClass()
{
    self ClearPerks();
    self TakeAllWeapons();
    self GiveWeapon(level.zombieStartWeapon);
    self SwitchToWeapon(level.zombieStartWeapon);
    self SetWeaponAmmoStock(level.zombieStartWeapon, 0);
    self SetWeaponAmmoClip(level.zombieStartWeapon, 0);

    self thread ResetMenu();

    // Disable weapon pickup
    self endon ("death");
	self endon ("disconnect");
	self waittill("weapon_change");

    // Check for running mod
	if (level.stopZombieLand == true)
	{
		return;
	}

    if (self GetCurrentWeapon() == level.megaZombieWeapon && self.isInMegaZombie == true)
    {
        return;
    }

    if (self GetCurrentWeapon() == level.tacticalInsertion)
    {
        wait 0.4;
    }

    self thread GiveZombieClass();
}

WatchTactical()
{
    if (self.tacticalSet == false)
    {
        self GiveWeapon(level.tacticalInsertion);
    }

    self endon ("death");
	self endon ("disconnect");
	self waittill("weapon_change", weapon);

    wait 0.2;

    if (weapon == level.tacticalInsertion && self.tacticalSet == false)
    {
        self.tacticalSet = true;
        self.tacticalPos = self.origin;
        self TakeWeapon(level.tacticalInsertion);
        self thread PlayerMessageMiddle("^2Tactical Insertion set!");
    }
    else
    {
        wait 1;
        self thread WatchTactical();
    }
}


// CHANGE TEAM Logic
ChangeTeam(team)
{
    wait 0.1;
    if(isAlive(self))
	{
        self.switching_teams = true;
		self.joining_team = team;
		self.leaving_team = self.pers["team"];
		self Suicide();
	}
	self.pers["team"] = team;
	self.team = team;
}


// PLAYER buy function
GiveInvisible(time)
{
    if (self.isInvisible == true)
    {
        self thread PlayerMessageLeftUnder("^1You are already invisible!");
        return;
    }

    self thread PlayerMessageLeftUnder("You are now ^2invisible ^7for " + time + " seconds");
    self.isInvisible = true;
    self Hide();
    wait time;
    self Show();
    self.isInvisible = false;
    self thread PlayerMessageLeftUnder("You are ^1no longer ^7invisible");
}

GiveFlickering(time)
{
    self thread PlayerMessageLeftUnder("You are now ^2flickering ^7for " + time + " seconds");
    wait time;
    self thread PlayerMessageLeftUnder("You are ^1no longer ^72flickering");
}

GivePlayerMaxAmmo()
{
    self thread PlayerMessageLeftUnder("You got ^2max ammo ^7for your current weapon");
    self SetWeaponAmmoClip(self GetCurrentWeapon(), WeaponClipSize(self GetCurrentWeapon()));
	self GiveMaxAmmo(self GetCurrentWeapon());
}

GivePlayerHealth(localHealth)
{
    self thread PlayerMessageLeftUnder("You got ^2" + localHealth + " ^7extra ^1health");
    self AddHealth(localHealth);
}

GivePlayerMoney(localMoney)
{
    self thread PlayerMessageLeftUnder("You got ^2" + localMoney + " ^7extra ^1money");
    self AddMoney(localMoney);
}

GivePlayerSteelSkin(localHealth)
{
    self endon ("disconnect");
    self endon ("death");

    self thread PlayerMessageLeftUnder("You got ^2Steel Skin ^7for ^520 seconds");
    self.beforeFunctionHealth = self.phealth;
    self.phealth += localHealth;
    self.maxhealth = self.phealth;
    self.health = self.maxhealth;
    self thread CreateHealthHUD();

    wait 20;
    self thread PlayerMessageLeftUnder("Your ^2Steel Skin ^7is over");
    self.phealth = self.beforeFunctionHealth;
    self.maxhealth = self.phealth;
    self.health = self.maxhealth;
    self thread CreateHealthHUD();
}

GiveRandomPerk()
{
    self thread PlayerMessageLeftUnder("You got a ^2Random Perk");
    self SetPerk(level.perks[RandomIntRange(0, level.perks.size)]);
}

GiveRandomWeapon()
{
    randomWeapon = level.mbweapons[RandomIntRange(0, level.mbweapons.size)];
    self thread PlayerMessageLeftUnder("You got a ^2Random Weapon^7 " + randomWeapon);
    self giveWeapon(randomWeapon);
    self giveMaxAmmo(randomWeapon);
}

GiveExplosiveSniper()
{
    self endon ("disconnect");
	self endon ("death");
    level endon ("game_ended");

	if(self.hasExplosiveSniper == true)
    {
        self GivePlayerMoney(25);
        return;
    }
	self.hasExplosiveSniper = true;

	self thread PlayerMessageLeftUnder("You got a ^2Explosive Sniper");
	self GiveWeapon(level.explosiveSniper);
	self GiveMaxAmmo(level.explosiveSniper);
	wait .5;
	self SwitchToWeapon(level.explosiveSniper);

	while(1)
	{
        self waittill("weapon_fired");
		weap = self GetCurrentWeapon();

		if(weap != level.explosiveSniper)
        {
            wait .1;
            continue;
        }

		my = self GetTagOrigin("j_head");
        trace = BulletTrace(my, my + AnglesToForward(self GetPlayerAngles())*100000,true,self)["position"];
        PlayFx(level.expBull, trace);
        self PlaySound(level.megaZombieGunSound);
        RadiusDamage(trace, 60, 40, 10, self);
        EarthQuake(0.9, 2, self.origin, 30);
	}
}

GivePlayerBurn(type, time)
{
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];

        p thread PlayerMessageLeftUnder("You got distracted ^1by the enemy^7!");

        if (type == "human" && p IsHuman() == true)
        {
            p SetBurn(time);
        }
        
        if (type == "zombie" && p IsHuman() == false)
        {
            p SetBurn(time);
        }
    }
}