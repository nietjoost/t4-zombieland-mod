#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\menu\menubuylogic;
#include scripts\mp\utils\utils;

// Spawn MysteryBox box
SpawnMysteryBox(location, angle)
{
    mb = Spawn("script_model", location);
    mb.angles = angle;
	mb SetModel(level.mysteryBoxModel);

    mbTrigger = Spawn("trigger_radius", location, 0, 50, 50);
    mb thread WatchMBHuman();
}

// Check for pickup interaction
WatchMBHuman()
{
    level endon ("game_ended");
    level endon ("stop_zombieland");

    self.inUse = false;
    self.inAnimation = false;
    self.totalUses = 0;

    while(1)
    {
        for ( i = 0; i < level.players.size; i++ )
        {
            p = level.players[i];

            if (p IsHuman() == false)
		    {
                continue;
            }

            // Set the hintstring
            if (Distance(p.origin, self.origin) <= 50)
            {
                if (self.inUse == true && self.inAnimation == false && self.user == p.name)
                {
                    p.hint = "Hold ^1[{+melee}] ^7to get the weapon";

                    // Check for BUTTON press
                    if (p MeleeButtonPressed())
                    {
                        wait 0.1;
                        if (p MeleeButtonPressed())
                        {
                            p GiveWeapon(self.randomWeapon);
                            p GiveMaxAmmo(self.randomWeapon);
                            p SwitchToWeapon(self.randomWeapon);
                            p PlayerMessageLeftUnder("^5You got the weapon!");
                            p PlaySound(level.buySound);
                            self.currentWeapon Delete();
                            p.hint = "";
                            wait 2;
                            self.inUse = false;
                        }
                    }
                }
                else if (self.inUse == false && self.inAnimation == false)
                {
                    p.hint = "Press ^1[{+melee}] ^7for a Random Weapon [Cost: ^3" + level.mysteryBoxCost + "^7]";

                    if (p MeleeButtonPressed())
                    {
                        if (p IsHuman() == false)
                        {
                            p thread PlayerMessageLeftUnder("Zombies can not use the Mystery Box!");
                            continue;
                        }

                        if (p thread CheckMoney(level.mysteryBoxCost))
                        {
                            wait 1;
                            continue;
                        }

                        self.inUse = true;
                        self.inAnimation = true;
                        self.user = p.name;
                        self.totalUses++;
                        p PlayerMessageLeftUnder("^5You purchased the ^1Mystery Box^5!");
                        p PlaySound(level.fupppSound);
                        p.hint = "";

                        // Mystery Box show logic
                        self.currentWeapon = Spawn("script_model", self.origin);
                        self.currentWeapon SetModel(GetWeaponModel(level.mbweapons[RandomIntRange(0, level.mbweapons.size)]));
                        self.currentWeapon.angles = self.angles + (0, 90, 0);
                        self.currentWeapon MoveTo(self.currentWeapon.origin + (0, 0, 55), 10, 2, 2);

                        wait 2.1;
                        for (i = 0; i < 30; i++)
                        {
                            self.randomWeapon = level.mbweapons[RandomIntRange(0, level.mbweapons.size)];
                            self.currentWeapon SetModel(GetWeaponModel(self.randomWeapon));
                            p PlaySound(level.noMoneySound);
                            wait 0.3;
                        }
                        self.currentWeapon MoveTo(self.currentWeapon.origin + (0, 0, -30), 30, 2, 2);
                        self.inAnimation = false;
                        self thread MBResetAfterSeconds(p.name, self.totalUses);
                    }
                }
            }
            else if (Distance(p.origin, self.origin) > 50 && Distance(p.origin, self.origin) < 300)
            {
                p.hint = "";
            }
        }
        wait 0.01;
    }
}


MBResetAfterSeconds(name, uses)
{
    wait 20;
    if (self.name == name && self.totalUses == uses)
    {
        self.currentWeapon Delete();
        self.inUse = false;
    }
}