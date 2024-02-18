#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\utils\player;
#include scripts\mp\utils\utils;
#include scripts\mp\menu\menu;
#include scripts\mp\menu\menubuylogic;
#include maps\mp\_utility;
#include common_scripts\utility; 

// JETPACK LOGIC
JetPack()
{
    self endon("death");
    self.hasJetPack = true;

    self.jetboots = 100;

    while (self.hasJetPack)
    {
        if (self UseButtonPressed() && self.jetboots > 0)
        {
            self PlaySound("artillery_launch");
            PlayFx(level.expBull, self GetTagOrigin("J_Ankle_LE"));
            EarthQuake(.15, .2, self.origin, 200);
            self.jetboots--;

            if(self GetVelocity()[2] < 300)
            {
                //self setvelocity(self getvelocity()+(0,0,60));
                self SetOrigin(self.origin + (0, 0, 50));
            }
        }

        if (self.jetboots < 100 && !self UseButtonPressed())
        {
            self.jetboots++;
        }
        wait .1;
    }
}


// PLAYER BUY LOGIC
BuyJetPack()
{
    if (self.hasJetPack)
    {
        self thread PlayerMessageLeftUnder("^1You already have a JetPack");
        return;
    }

    if (self thread CheckMoney(level.buyJetPack))
    {
        return;
    }
    
    self thread PlayerMessageLeftUnder("You bought a ^2JetPack");
    self thread PlayerMessageMiddle("Hold ^1[{+activate}] ^7to use the ^2JetPack");
    wait 1;
    self thread JetPack();
}

BuyJetPackZombie()
{
    self endon("death");

    if (self.hasJetPack)
    {
        self thread PlayerMessageLeftUnder("^1You already have a JetPack");
        return;
    }

    if (self thread CheckMoney(level.buyJetPackZombie))
    {
        return;
    }
    
    self thread PlayerMessageLeftUnder("You bought a ^2JetPack ^7for 40 seconds");
    self thread PlayerMessageMiddle("Hold ^1[{+activate}] ^7to use the ^2JetPack");
    wait 1;
    self thread JetPack();
    wait 40;
    self.hasJetPack = false;
    self thread PlayerMessageLeftUnder("^1Your JetPack is over!");
}


GiveFreeJetPack()
{
    self endon("death");

    if (self.hasJetPack)
    {
        self thread PlayerMessageLeftUnder("^1You already have a JetPack");
        return;
    }
    
    self thread PlayerMessageLeftUnder("You get the random drop ^2JetPack ^7for 40 seconds");
    self thread PlayerMessageMiddle("Hold ^1[{+activate}] ^7to use the ^2JetPack");
    self thread JetPack();
    wait 40;
    self.hasJetPack = false;
    self thread PlayerMessageLeftUnder("^1Your JetPack is over!");
}