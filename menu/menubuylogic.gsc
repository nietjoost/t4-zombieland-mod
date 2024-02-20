#include scripts\mp\events\instaKill;
#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\killstreaks\predatormissile;
#include scripts\mp\menu\menu;
#include scripts\mp\utils\player;
#include scripts\mp\utils\utils;

//Check money
CheckMoney(cost)
{
    if (cost <= self.money)
    {
        self thread RemoveMoney(cost);
        self PlaySound(level.buySound);
        return false;
    }

    self PlaySound(level.noMoneySound);
    self thread PlayerMessageLeftUnder("You do not have enough money!");
    return true;
}

// Upgrade current weapon
UpgradeWeapon()
{
    if(!isDefined(level.weapons[self getCurrentWeapon()]["upgradeName"]))
    {
        self thread PlayerMessageLeftUnder("No upgrade available for this weapon!");
        return;
    }

    if (self thread CheckMoney(level.upgradeWeaponsMoney))
    {
        return;
    }

    currentWeapon = self getCurrentWeapon();
    self giveWeapon(level.weapons[self getCurrentWeapon()]["upgradeName"]);
    self giveMaxAmmo(level.weapons[self getCurrentWeapon()]["upgradeName"]);
    self switchToWeapon(level.weapons[self getCurrentWeapon()]["upgradeName"]);
    self TakeWeapon(currentWeapon);

    self thread PlayerMessageLeftUnder("You upgraded your current weapon!");
    self PlaySound(level.upgradeSound);
}

// Give the weapon
GiveBuyWeapon(weapon, msg)
{
    self giveWeapon(weapon);
    self giveMaxAmmo(weapon);
    self switchToWeapon(weapon);

    self thread PlayerMessageLeftUnder(msg);
}

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(level.weapons["thompson_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["thompson_mp"]["name"], "You bought the weapon Thompson!");
}

GiveType100()
{
    if (self thread CheckMoney(level.weapons["type100smg_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["type100smg_mp"]["name"], "You bought the weapon Type 100!");
}

GivePpsh()
{
    if (self thread CheckMoney(level.weapons["ppsh_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["ppsh_mp"]["name"], "You bought the weapon Ppsh!");
}

GiveM1Garand()
{
    if (self thread CheckMoney(level.weapons["m1garand_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["m1garand_mp"]["name"], "You bought the weapon M1 Garand!");
}

GiveStg44()
{
    if (self thread CheckMoney(level.weapons["stg44_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["stg44_mp"]["name"], "You bought the weapon Stg44!");
}

GiveFg42()
{
    if (self thread CheckMoney(level.weapons["fg42_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["fg42_mp"]["name"], "You bought the weapon Fg42!");
}


// Give Perk functions
GiveBuyPerk(perk, msg)
{
    self SetPerk(perk);
    self thread PlayerMessageLeftUnder(msg);
}

GivePerkSleight()
{
    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[1], "You bought the perk Sleight of Hand!");
}

GivePerkSprint()
{
    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[2], "You bought the perk Longer Sprint!");
}

GivePerkStoppingPower()
{
    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[3], "You bought the perk Stopping Power!");
}

GivePerkNext()
{
    if (self.nextPerk > level.perks.size)
    {
        self thread PlayerMessageLeftUnder("You already have all perks!");
        return;
    }

    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[self.nextPerk], "You bought the perk " + level.perks[self.nextPerk] + "!");
    self.nextPerk++;
}

// Killstreaks
GiveUav()
{
    if (self thread CheckMoney(level.uavCost))
    {
        return;
    }

    GiveBuyWeapon("radar_mp", "You bought the killstreak UAV!");
}

GiveArtillery()
{
    if (self thread CheckMoney(level.artilleryCost))
    {
        return;
    }

    GiveBuyWeapon("artillery_mp", "You bought the killstreak Artillery!");
}

GiveDogs()
{
    if (self thread CheckMoney(level.dogsCost))
    {
        return;
    }

    GiveBuyWeapon("dogs_mp", "You bought the killstreak Dogs!");
}

// Specials
FreezeZombies()
{
    if (self thread CheckMoney(level.freezeZombiesCost))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("^2The zombies are now frozen for 15 seconds!");

    zombies = level thread GetPlayerZombies();

    for ( i = 0; i < zombies.size; i++ )
    {
        p = zombies[i];
        p FreezeControls(true);
    }
    AllPlayerMessageMiddle("^3The zombies are frozen!");

    wait 15;

    for ( i = 0; i < zombies.size; i++ )
    {
        p = zombies[i];
        p FreezeControls(false);
    }
    AllPlayerMessageMiddle("^3The zombies are un-frozen!");
}

BlockZiplines()
{
    if (self thread CheckMoney(level.blockZiplinesCost))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("^2The zombies are blocked from using the ZipLine for 10 seconds!");
    level.buyZiplineBlock = true;

    wait 10;
    level.buyZiplineBlock = false;
}

SlowerZombies()
{
    if (self thread CheckMoney(level.slowerZombiesCost))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("^2The zombies are now walking slower for 20 seconds!");
    AllPlayerMessageMiddle("^1Someone bought slower zombies for 20 seconds!");
    level.buySlowerZombies = true;

    wait 20;
    level.buySlowerZombies = false;
}

BuyGrenade()
{
    currentAmmo = self GetWeaponAmmoClip("frag_grenade_mp");

    if (currentAmmo >= 4)
    {
        self thread PlayerMessageLeftUnder("^1You already have 4 grenades!");
        return;
    }

    if (self thread CheckMoney(level.buyGrenadeCost))
    {
        return;
    }

    newCurrentAmmo = currentAmmo + 1;
    GiveBuyWeapon("frag_grenade_mp", "You bought a grenade!");
    self SetWeaponAmmoClip("frag_grenade_mp", newCurrentAmmo);
}

BuyMaxAmmoCurrentWeapon()
{
    if (self thread CheckMoney(level.buyMaxAmmoCurrentWeapon))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought ^2max ammo ^7for your current weapon");
    self SetWeaponAmmoClip(self GetCurrentWeapon(), WeaponClipSize(self GetCurrentWeapon()));
	self GiveMaxAmmo(self GetCurrentWeapon());
}

BuyMaxAmmoAllWeapons()
{
    if (self thread CheckMoney(level.buyMaxAmmoAllWeapons))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought ^2max ammo ^7for all your weapons");
    
    weapons = self GetWeaponsList();
	for (i=0; i < weapons.size; i++ )
	{
		self SetWeaponAmmoClip(weapons[i], WeaponClipSize(weapons[i]));
	    self GiveMaxAmmo(weapons[i]);
	}
}

BuyTeleportPlayer()
{
    if (self thread CheckMoney(level.buyTeleport))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought the ^2teleport selector");
    self thread TeleportPlayer();
}

BuyInstaKill()
{
    if (self.hasInstaKill)
    {
        self thread PlayerMessageLeftUnder("^1You already have Insta Kill!");
        return;
    }

    if (self thread CheckMoney(level.buyInstaKill))
    {
        return;
    }

    self endon ("death");
    self thread PlayerMessageLeftUnder("You bought ^2Insta Kill ^7for 30 seconds");
    self thread ControlMenu("close");
    self.hasInstaKill = true;

    // Watch for instakill
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        p thread CheckInstaKillHealth(self);
    }

    wait 30;
    self.hasInstaKill = false;
    self thread PlayerMessageLeftUnder("^2Insta Kill ^1has ended!");
}

BuyInvisible()
{
    if (self.isInvisible)
    {
        self thread PlayerMessageLeftUnder("^1You already have invisibility");
        return;
    }

    if (self thread CheckMoney(level.buyInvisible))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought ^2invisibility for 20 seconds");
    self thread GiveInvisible(20);
}

BuyPredator()
{
    if (level.predatorInUse == true)
    {
        self thread PlayerMessageLeftUnder("^1The predator missile is already in use!");
        return;
    }

    if (self thread CheckMoney(level.BuyPredator))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought the ^2predator missile!");
    self thread ControlMenu("close");

    wait 1;
    self thread StartPredator();
}

BuyIncreaseSpeed()
{
    if (self thread CheckMoney(level.buyIncreaseSpeed))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("You bought ^5extra ^7walk speed");
    self.moveSpeedScale += 0.1;
    self SetMoveSpeedScale(self.moveSpeedScale);
}

BuyStickyGrenade()
{
    currentAmmo = self GetWeaponAmmoClip("sticky_grenade_mp");

    if (currentAmmo >= 4)
    {
        self thread PlayerMessageLeftUnder("^1You already have 4 sticky grenades!");
        return;
    }

    if (self thread CheckMoney(level.buyGrenadeCost))
    {
        return;
    }

    newCurrentAmmo = currentAmmo + 1;
    GiveBuyWeapon("sticky_grenade_mp", "You bought a sticky grenades!");
    self SetWeaponAmmoClip("sticky_grenade_mp", newCurrentAmmo);
}

BuyMolotov()
{
    currentAmmo = self GetWeaponAmmoClip("molotov_mp");

    if (currentAmmo >= 4)
    {
        self thread PlayerMessageLeftUnder("^1You already have 4 molotov's!");
        return;
    }

    if (self thread CheckMoney(level.buyGrenadeCost))
    {
        return;
    }

    newCurrentAmmo = currentAmmo + 1;
    GiveBuyWeapon("molotov_mp", "You bought a molotov!");
    self SetWeaponAmmoClip("molotov_mp", newCurrentAmmo);
}