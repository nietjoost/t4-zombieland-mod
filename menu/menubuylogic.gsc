#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\utils\utils;

//Check money
CheckMoney(cost)
{
    if (cost <= self.money)
    {
        self thread RemoveMoney(cost);
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
    self PlaySound(level.buySound);
}

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(level.weapons["thompson_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["thompson_mp"]["name"], "You bought the weapon Thompson!");
    self PlaySound(level.buySound);
}

GiveType100()
{
    if (self thread CheckMoney(level.weapons["type100smg_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["type100smg_mp"]["name"], "You bought the weapon Type 100!");
    self PlaySound(level.buySound);
}

GivePpsh()
{
    if (self thread CheckMoney(level.weapons["ppsh_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["ppsh_mp"]["name"], "You bought the weapon Ppsh!");
    self PlaySound(level.buySound);
}

GiveM1Garand()
{
    if (self thread CheckMoney(level.weapons["m1garand_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["m1garand_mp"]["name"], "You bought the weapon M1 Garand!");
    self PlaySound(level.buySound);
}

GiveStg44()
{
    if (self thread CheckMoney(level.weapons["stg44_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["stg44_mp"]["name"], "You bought the weapon Stg44!");
    self PlaySound(level.buySound);
}

GiveFg42()
{
    if (self thread CheckMoney(level.weapons["fg42_mp"]["money"]))
    {
        return;
    }

    self thread GiveBuyWeapon(level.weapons["fg42_mp"]["name"], "You bought the weapon Fg42!");
    self PlaySound(level.buySound);
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
    self PlaySound(level.buySound);
}

GivePerkSprint()
{
    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[2], "You bought the perk Longer Sprint!");
    self PlaySound(level.buySound);
}

GivePerkStoppingPower()
{
    if (self thread CheckMoney(level.perksMoney))
    {
        return;
    }

    self thread GiveBuyPerk(level.perks[3], "You bought the perk Stopping Power!");
    self PlaySound(level.buySound);
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
    self PlaySound(level.buySound);
}

// Killstreaks
GiveUav()
{
    if (self thread CheckMoney(level.uavCost))
    {
        return;
    }

    GiveBuyWeapon("radar_mp", "You bought the killstreak UAV!");
    self PlaySound(level.buySound);
}

GiveArtillery()
{
    if (self thread CheckMoney(level.artilleryCost))
    {
        return;
    }

    GiveBuyWeapon("artillery_mp", "You bought the killstreak Artillery!");
    self PlaySound(level.buySound);
}

GiveDogs()
{
    if (self thread CheckMoney(level.dogsCost))
    {
        return;
    }

    GiveBuyWeapon("dogs_mp", "You bought the killstreak Artillery!");
    self PlaySound(level.buySound);
}

// Specials
FreezeZombies()
{
    if (self thread CheckMoney(level.freezeZombiesCost))
    {
        return;
    }

    self thread PlayerMessageLeftUnder("^2The zombies are now frozen for 15 seconds!");
    self PlaySound(level.buySound);

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
    self PlaySound(level.buySound);
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
    self PlaySound(level.buySound);
    AllPlayerMessageMiddle("^1Someone bought slower zombies for 20 seconds!");
    level.buySlowerZombies = true;

    wait 20;
    level.buySlowerZombies = false;
}