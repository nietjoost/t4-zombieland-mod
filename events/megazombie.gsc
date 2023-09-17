#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\events\gamelogic;

// Mega ZombieCode
WatchZombieBoss()
{
	while(1)
	{
		// Check if enough Zombies
		if (CalculateTotalZombies() < 3 || level.zombieBoss == true)
		{
			wait 10;
		}
		else
		{
			// Set ZombieLand Settings
			level.zombieBoss = true;
			SetExpFog(200, 1000, 0.5, 0.4, 0.4, 6);
			zpos = 0;

			// Set ZombieBoss position
			for ( i = 0; i < level.players.size; i++ )
			{	
				p = level.players[i];
				if (p IsHuman() == false) 
				{
					if(zpos == 0) level.zbdriver = p;
					p.zpos = zpos;
					zpos++;
					p FreezeControls(true);
					p GiveMegaZombieClass();
				}
			}
			
			// Start MegaZombie
			AllPlayerMessageMiddle("^3The zombies are forming a MegaZombie!");

			level thread StartZombieBoss();
		}
	}
}

StartZombieBoss()
{
	// Link Zombies to ZombieBoss
	level.mzs = Spawn("script_origin", level.zbdriver.origin);
	level.mzs LinkTo(level.zbdriver);
	
	for ( i = 0; i < level.players.size; i++ )
	{
		p = level.players[i];
		if (p IsHuman() == false) 
		{
			if(p.zpos == 1) p.newPos = (level.mzs.origin + (0,0,90));
			if(p.zpos == 2) p.newPos = (level.mzs.origin + (0,-40,130));
			if(p.zpos == 3) p.newPos = (level.mzs.origin + (0,40,130));
			if(p.zpos == 4) p.newPos = (level.mzs.origin + (0,0,180));
			if(p.zpos == 5) p.newPos = (level.mzs.origin + (0,60,0));
			if(p.zpos == 6) p.newPos = (level.mzs.origin + (0,-60,0));
			if(p.zpos == 7) p.newPos = (level.mzs.origin + (0,-80,100));
			if(p.zpos == 8) p.newPos = (level.mzs.origin + (0,80,100));
			if(p.zpos == 9) p.newPos = (level.mzs.origin + (0,0,240));
			if(p.zpos == 10) p.newPos = (level.mzs.origin + (0,60,250));
			if(p.zpos == 11) p.newPos = (level.mzs.origin + (0,-60,250));
			if(p.zpos == 12) p.newPos = (level.mzs.origin + (0,-0,320));
			if(p.zpos != 0)	p SetOrigin(p.newPos);
			if(p.zpos != 0)	p LinkTo(level.mzs);

			// ZombieBoss health logic
			p.maxhealth = 99999999;
        	p.health = p.maxhealth;
			p thread CheckZombieBossHealth();
		}
	}

	level thread ZombieBossTimer();

	// Zombie Driver
	level.zbdriver PlayerMessageMiddle("^5You are the head ^1MegaZombie!");
	level.zbdriver PlayerMessageMiddle("^2You ^1lead ^2the ^5MegaZombie");
	level.zbdriver SetMoveSpeedScale(0.6);
	wait 5;
	level.zbdriver FreezeControls(false);
}

ZombieBossTimer()
{
	wait 90;
	AllPlayerMessageMiddle("^3MegaZombie ^1timer is up!");
	HandleZombieBossDeath();
}

CheckZombieBossHealth()
{
	while(1)
	{
		level endon ("stop_zombieboss");
		level endon ("stop_zombieland");

		self waittill ( "damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags );
		if(attacker.team != "axis")
		{
			level.zombieBossHealth -= 1;
		}

		if (level.zombieBossHealth < 5)
		{
			level thread HandleZombieBossDeath();
		}
		wait .01;
	}
}

HandleZombieBossDeath()
{
	// Clean-up MegaZombie
	level.mzs Delete();
	level notify ("stop_zombieboss");

	// Reset Fog
	SetExpFog(200, 800, 0.5, 0.5, 0.5, 10);

	// Handle Player end MegaZombie
	for ( i = 0; i < level.players.size; i++ )
	{
		p = level.players[i];
		if (p IsHuman() == false) 
		{
			p.health = 100;
			p Suicide();
			p UnLink(level.mzs);
		}
		else
		{
			p PlayerMessageMiddle("^5You survided the ^1MegaZombie^2!");
			p PlayerMessageMiddle("^2You won $500!");
			p AddMoney(500);
		}
	}

	// Start new MegaZombie in X seconds
	wait 240;
	level.zombieBoss = false;
}

// MegaZombie Utils
IsHuman()
{
	if (self.pers["team"] == "allies")
	{
		return true;
	}
	return false;
}

GiveMegaZombieClass()
{
	self ClearPerks();
    self TakeAllWeapons();
	wait 0.1;
    self GiveWeapon("colt_mp");
    self SwitchToWeapon("colt_mp");
    self SetWeaponAmmoStock("colt_mp", 8);
    self SetWeaponAmmoClip("colt_mp", 8);
}