#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;

//Check money
CheckMoney(cost)
{
    if (cost <= self.money)
    {
        RemoveMoney(cost);
        return true;
    }
    self thread PlayerMessageLeftUnder("You do not have enough money!");
    return false;
}

// Give Weapon functions
GiveThompson()
{
    if (self thread CheckMoney(100) == false)
    {      
        return;
    }

    self giveWeapon("thompson_mp");
    self giveMaxAmmo("thompson_mp");
    self switchToWeapon("thompson_mp");

    self thread PlayerMessageLeftUnder("You bought the weapon Thompson!");
}