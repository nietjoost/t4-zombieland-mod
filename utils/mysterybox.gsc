#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\menu\menubuylogic;
#include scripts\mp\utils\utils;

// Mystery box logic
SpawnMysteryBox(location, angle)
{
    mb = Spawn("script_model", location);
    mb.angles = angle;
	mb SetModel(level.boost);

    mbTrigger = Spawn("trigger_radius", location, 0, 150, 150);
    mbTrigger thread WatchMBHuman(mb);
}

WatchMBHuman(mb)
{
    mb.inUse = false;
    while(1)
    {
        level endon ("stop_zombieland");
        self waittill("trigger", player);
        if (player MeleeButtonPressed())
        {
            if (player IsHuman() == false && mb.inUse == false)
            {
                continue;
            }

            mb.inUse = true;

            currentWeapon = Spawn("script_model", mb.origin);
		    currentWeapon.angles = mb.angles + (0, 90, 0);
            currentWeapon SetModel(level.mbweapons[0]);
            currentWeapon MoveTo(currentWeapon.origin + (0, 0, 60), 10, 2, 2);
            for (i = 0; i < 30; i++)
            {
                tempRandomWeapon = level.mbweapons[randomint(level.mbweapons.size)];
                currentWeapon SetModel(GetWeaponModel(tempRandomWeapon));
                wait 0.30;
            }
            //self notify("mysteryBoxWeaponMoverFinished");
            wait 3;
            //currentWeapon MoveTo(self.origin, 10, 2, 2);

            mb.inUse = false;
        }
    }
}