#include scripts\mp\menu\menu;
#include scripts\mp\hud\healthlogic;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\playermessage;

// Classes
GivePlayerClass()
{
    self clearPerks();
    self takeAllWeapons();
    self giveWeapon("mp40_mp");
    self giveMaxAmmo("mp40_mp");
    self switchToWeapon("mp40_mp");

    self giveWeapon("colt_mp");
    self giveMaxAmmo("colt_mp");

    self FreezeControls(false);
}


GiveZombieClass()
{
    self ClearPerks();
    self TakeAllWeapons();
    self giveWeapon("colt_mp");
    self switchToWeapon("colt_mp");
    self setWeaponAmmoStock("colt_mp", 0);
    self setWeaponAmmoClip("colt_mp", 0);

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

    // Check if using menu
    if (self getCurrentWeapon() == "briefcase_bomb_defuse_mp")
    {
        return;
    }

    if (self getCurrentWeapon() == "357magnum_mp" && self.isInMegaZombie == true)
    {
        return;
    }

    self thread GiveZombieClass();
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