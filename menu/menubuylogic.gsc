#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;

//Check money
CheckMoney(cost)
{
    if (cost <= self.money)
    {
        self thread RemoveMoney(cost);
        return false;
    }

    self PlaySound("ui_mp_suitcasebomb_timer");
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
    self PlaySound("mp_level_up");
}

// Give the weapon
GiveBuyWeapon(weapon, msg)
{
    self giveWeapon(weapon);
    self giveMaxAmmo(weapon);
    self switchToWeapon(weapon);

    self thread PlayerMessageLeftUnder(msg);
    self PlaySound("carbine_first_raise");
}

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(level.weapons["thompson_mp"]["money"]))     
        return;

    self thread GiveBuyWeapon(level.weapons["thompson_mp"]["name"], "You bought the weapon Thompson!");
}

GiveType100()
{
    if (self thread CheckMoney(level.weapons["type100smg_mp"]["money"]))
        return;

    self thread GiveBuyWeapon(level.weapons["type100smg_mp"]["name"], "You bought the weapon Type 100!");
}

GiveM1Garand()
{
    if (self thread CheckMoney(level.weapons["m1garand_mp"]["money"]))
        return;

    self thread GiveBuyWeapon(level.weapons["m1garand_mp"]["name"], "You bought the weapon Type 100!");
}


// Give Perk functions
GivePerkSleight()
{
    self setperk("specialty_fastreload");
}

GivePerkBulletFlinch()
{
    self setperk("specialty_bulletdamage");
}

GivePerkSprint()
{
    self setperk("specialty_longersprint");
}