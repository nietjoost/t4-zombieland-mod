#include scripts\mp\hud\playermessage;
#include scripts\mp\menu\menu;

// Start function
StartPredator()
{
    // Setup
    level.predatorInUse = true;
    self.weapons = self GetWeaponsList();
    self Hide();
    self FreezeControls(true);

    // FADE
    self.fadeToBlack = NewClientHudElem(self);
    self.fadeToBlack.x = 0; 
    self.fadeToBlack.y = 0; 
    self.fadeToBlack.alpha = 0; 
    self.fadeToBlack.horzAlign = "fullscreen"; 
    self.fadeToBlack.vertAlign = "fullscreen"; 
    self.fadeToBlack.foreground = true; 
    self.fadeToBlack SetShader( "black", 640, 480 ); 
    self.fadeToBlack FadeOverTime(.5); 
    self.fadeToBlack.alpha = 1;

    wait 0.5;

    originalPos = self.origin;
    bombEnt = Spawn("script_origin", self.origin);
	self LinkTo(bombEnt);
    self TakeAllWeapons();
    
    // Watch Thread
    self thread PredatorCircleAround(bombEnt, originalPos);
    self thread WatchPredatorMissile(bombEnt, originalPos);
    wait 0.5;
    self thread SetPredatorUI();
}


// THREAD Functions
PredatorCircleAround(bombEnt, originalPos)
{
    level endon ("predator_stop_timeup");
    self endon ("death");
    self endon ("disconnect");

    // BOTOM LOGIC
    travelTime = 4;
    bombEnt MoveTo(self.origin + (0, 0, 1400), travelTime);
    self SetPlayerAngles((84, -180, 0));

    wait travelTime;
    self FreezeControls(false);
    self.fadeToBlack FadeOverTime(1);
    self.fadeToBlack.alpha = 0;

    // TOP LOGIC
    pos1 = self.origin + (800, 800, 0);
    pos2 = self.origin - (800, 800, 0);

    bombEnt MoveTo(pos1, 10);
    wait 10;
    bombEnt MoveTo(pos2, 10);
    wait 10;
    bombEnt MoveTo(pos1, 10);
    wait 10;
    self thread PlayerMessageMiddle("Hold ^1[{+attack}] ^7within ^210 seconds!");
    bombEnt MoveTo(pos2, 10);
    wait 10;
    level notify ("predator_stop_pre_timeup");
    level.predatorInUse = false;
    self Unlink();
    wait 0.1;
    self SetOrigin(originalPos);
    self thread GiveWeaponsBack();
    self Show();
    self.predatorUI Destroy();
    bombEnt Destroy();
    self.fadeToBlack Destroy();
    self thread PlayerMessageMiddle("^2Your predator missile time is up!");

    wait 0.5;
    level notify ("predator_stop_timeup");
}

WatchPredatorMissile(bombEnt, originalPos)
{
    level endon ("predator_stop_pre_timeup");
    self endon ("death");
    self endon ("disconnect");

    wait 2;
    self thread PlayerMessageMiddle("Hold ^1[{+attack}] ^7to fire the ^2Predator Missile!");

    while (true)
    {
        if (self AttackButtonPressed())
        {
            self PlaySound(level.fupppSound);
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
    self FreezeControls(true);
    my = self GetTagOrigin("j_head");
    trace = BulletTrace(my, my + AnglesToForward(self GetPlayerAngles())*900000, true, self)["position"];

    bombEnt MoveTo(trace, 1.5);
    wait 1.3;

    self Unlink();
    bombEnt Destroy();
    self.fadeToBlack Destroy();
    wait 0.1;

    self SetOrigin(originalPos);
    self thread GiveWeaponsBack();
    self FreezeControls(false);
    self Show();
    self.predatorUI Destroy();
    wait 0.1;

    RadiusDamage(trace, 600, 600, 600, self);
    EarthQuake(.5, .2, self.origin, 850);
    self PlaySound(level.artilleryLaunchSound);
    wait 0.1;
    PlayFx(level.expBull, trace);

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
        self SwitchToWeapon(self.weapons[i]);
	}
}

SetPredatorUI()
{
    self.predatorUI = NewClientHudElem(self);
    self.predatorUI.alignX = "center";
    self.predatorUI.alignY = "center";
	self.predatorUI.horzAlign = "center";
	self.predatorUI.vertAlign = "middle";
    self.predatorUI.y = -20;
    self.predatorUI.sort = -5;
    self.predatorUI.archived = false;
    self.predatorUI.alpha = 1;
    self.predatorUI.font = "objective";
    self.predatorUI.fontscale = 12;
    self.predatorUI.color = (1, 0, 0);
    //self.predatorUI SetShader("tank_turret_mp", 640, 480 );
    self.predatorUI SetText("+");
}