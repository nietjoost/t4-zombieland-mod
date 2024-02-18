#include scripts\mp\hud\playermessage;
#include scripts\mp\menu\menu;

// Start function
StartPredator()
{
    // Setup
    level.predatorInUse = true;
    self.weapons = self GetWeaponsList();
    self FreezeControls(false);
    self TakeAllWeapons();

    originalPos = self.origin;
    self SetOrigin(self.origin + (0, 0, 1400));
    bombEnt = Spawn("script_origin", self.origin);
	self LinkTo(bombEnt);

    
    // Watch Thread
    self thread PredatorCircleAround(bombEnt, originalPos);
    self thread WatchPredatorMissile(bombEnt, originalPos);
}


// THREAD Functions
PredatorCircleAround(bombEnt, originalPos)
{
    level endon ("predator_stop_timeup");

    pos1 = self.origin + (800, 800, 0);
    pos2 = self.origin - (800, 800, 0);

    bombEnt MoveTo(pos1, 10);
    wait 10;
    bombEnt MoveTo(pos2, 10);
    wait 10;
    bombEnt MoveTo(pos1, 10);
    wait 10;
    self thread PlayerMessageMiddle("^1 Choose within 10 seconds!");
    bombEnt MoveTo(pos2, 10);
    wait 10;
    level notify ("predator_stop_pre_timeup");
    level.predatorInUse = false;
    self Unlink();
    wait 0.1;
    self SetOrigin(originalPos);
    self thread GiveWeaponsBack();
    bombEnt Destroy();
    self thread PlayerMessageMiddle("^2Your predator missile time is up!");

    wait 0.5;
    level notify ("predator_stop_timeup");
}

WatchPredatorMissile(bombEnt, originalPos)
{
    level endon ("predator_stop_pre_timeup");

    self thread PlayerMessageMiddle("Hold ^1[{+activate}] ^7to fire the ^2Predator Missile!");

    while (true)
    {
        if (self UseButtonPressed())
        {
            self PlaySound("flare_exp");
            EarthQuake(.5, .2, self.origin, 850);
            self thread GoMissile(bombEnt, originalPos);

            wait 0.1;
            level notify ("predator_stop_pre_timeup");
        }
        wait 0.2;
    }
}

GoMissile(bombEnt, originalPos)
{
    my = self GetTagOrigin("j_head");
    trace = BulletTrace(my, my + AnglesToForward(self GetPlayerAngles())*900000, true, self)["position"];

    bombEnt MoveTo(trace, 1.5);
    wait 1.3;

    self Unlink();
    bombEnt Destroy();
    wait 0.1;

    self SetOrigin(originalPos);
    self thread GiveWeaponsBack();
    wait 0.1;

    RadiusDamage(trace, 600, 600, 600, self);
    EarthQuake(.5, .2, self.origin, 850);
    self PlaySound("artillery_launch");
    PlayFx(level.expBull, trace);
    PlayFx(level.expBull, trace + (50, 50, 0));
    PlayFx(level.expBull, trace - (50, 50, 0));

    wait 0.1;
    level.predatorInUse = false;
    level notify ("predator_stop_timeup");
    level notify ("predator_stop_pre_timeup");
}

GiveWeaponsBack()
{
	for (i=0; i < self.weapons.size; i++ )
	{
        self GiveWeapon(self.weapons[i]);
        wait 0.1;
		self SetWeaponAmmoClip(self.weapons[i], WeaponClipSize(self.weapons[i]));
	    self GiveMaxAmmo(self.weapons[i]);
	}
}