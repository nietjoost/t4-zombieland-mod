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

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(level.weapons["thompson"]["money"]))
    {      
        return;
    }

    self giveWeapon(level.weapons["thompson"]["name"]);
    self giveMaxAmmo(level.weapons["thompson"]["name"]);
    self switchToWeapon(level.weapons["thompson"]["name"]);

    self thread PlayerMessageLeftUnder("You bought the weapon Thompson!");
}

GiveType100()
{
    if (self thread CheckMoney(level.weapons["type"]["money"]))
    {
        return;
    }

    self giveWeapon(level.weapons["type"]["name"]);
    self giveMaxAmmo(level.weapons["type"]["name"]);
    self switchToWeapon(level.weapons["type"]["name"]);

    self thread PlayerMessageLeftUnder("You bought the weapon Type 100!");
}