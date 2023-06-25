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
    self thread PlayerMessageLeftUnder("You do not have enough money!");
    return true;
}

// Upgrade current weapon
UpgradeWeapon()
{
    if(!isDefined(level.weapons[self getCurrentWeapon()]["upgradeName"]))
    {
        self thread PlayerMessageLeftUnder("No upgraded available for this weapon!");
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
}

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(level.weapons["thompson_mp"]["money"]))
    {      
        return;
    }

    self giveWeapon(level.weapons["thompson_mp"]["name"]);
    self giveMaxAmmo(level.weapons["thompson_mp"]["name"]);
    self switchToWeapon(level.weapons["thompson_mp"]["name"]);

    self thread PlayerMessageLeftUnder("You bought the weapon Thompson!");
}

GiveType100()
{
    if (self thread CheckMoney(level.weapons["type100smg_mp"]["money"]))
    {
        return;
    }

    self giveWeapon(level.weapons["type100smg_mp"]["name"]);
    self giveMaxAmmo(level.weapons["type100smg_mp"]["name"]);
    self switchToWeapon(level.weapons["type100smg_mp"]["name"]);

    self thread PlayerMessageLeftUnder("You bought the weapon Type 100!");
}