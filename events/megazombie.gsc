#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\events\gamelogic;
#include scripts\mp\utils\utils;

// Mega ZombieCode
WatchZombieBoss()
{
	level endon ("game_ended");
	level endon ("stop_zombieland");

	while(1)
	{
		// Check if enough Zombies
		if (CalculateTotalZombies() < 3 || level.zombieBoss == true || level.zombieBossFinal == true)
		{
			wait 60;
			continue;
		}
		else
		{
			// Set ZombieLand Settings
			level.zombieBoss = true;
			level.zombieBossFinal = true;
			SetExpFog(200, 1000, 0.5, 0.4, 0.4, 6);
			zpos = 0;

			// Sound
			for (s = 0; s < level.players.size; s++ )
			{
				level.players[s] PlaySound("veh_explo_small");
			}

			// Set ZombieBoss position
			zombies = GetPlayerZombies();
			megaZombies = [];
			for ( i = 0; i < zombies.size; i++ )
			{
				p = zombies[i];

				if (megaZombies.size > 12)
				{
					continue;
				}

				if(zpos == 0) level.zbdriver = p;
				p.zpos = zpos;
				zpos++;
				p.isInMegaZombie = true;
				p FreezeControls(true);
				p GiveMegaZombieClass();
				p thread ZombieBossFire();
				megaZombies[megaZombies.size] = p;
			}

			// Start MegaZombie
			AllPlayerMessageMiddle("^3The zombies are forming a MegaZombie!");

			level thread StartZombieBoss(megaZombies);
		}
	}
}

StartZombieBoss(zombies)
{
	// Link Zombies to ZombieBoss
	level.mzs = Spawn("script_origin", level.zbdriver.origin);
	level.mzs LinkTo(level.zbdriver);

	for ( i = 0; i < zombies.size; i++ )
	{
		p = zombies[i];
		if(p.zpos == 1) p.newPos = (level.mzs.origin + (0,0,90));
		if(p.zpos == 2) p.newPos = (level.mzs.origin + (0,-40,130));
		if(p.zpos == 3) p.newPos = (level.mzs.origin + (0,40,130));
		if(p.zpos == 4) p.newPos = (level.mzs.origin + (0,0,180));
		if(p.zpos == 5) p.newPos = (level.mzs.origin + (0,-60,250));
		if(p.zpos == 6) p.newPos = (level.mzs.origin + (0,-0,320));
		if(p.zpos == 7) p.newPos = (level.mzs.origin + (0,-80,100));
		if(p.zpos == 8) p.newPos = (level.mzs.origin + (0,80,100));
		if(p.zpos == 9) p.newPos = (level.mzs.origin + (0,0,240));
		if(p.zpos == 10) p.newPos = (level.mzs.origin + (0,60,250));
		if(p.zpos == 11) p.newPos = (level.mzs.origin + (0,80,350));
		if(p.zpos == 12) p.newPos = (level.mzs.origin + (0,-80,350));

		if(p.zpos != 0)	p SetOrigin(p.newPos);
		if(p.zpos != 0)	p LinkTo(level.mzs);

		// ZombieBoss health logic
		p.phealth = level.zombieBossHealth;
		p.maxhealth = p.phealth;
		p.health = p.maxhealth;
		p thread CheckZombieBossHealth();
	}

	level thread ZombieBossTimer();

	// Zombie Driver
	level.zbdriver PlayerMessageMiddle("^5You are the head ^1MegaZombie!");
	level.zbdriver PlayerMessageMiddle("^2You ^1lead ^2the ^5MegaZombie");
	level.zbdriver SetMoveSpeedScale(0.6);
	EarthQuake(0.8, 3, level.zbdriver.origin, 99999999);
	wait 5;
	level.zbdriver FreezeControls(false);
}

ZombieBossTimer()
{
	level endon ("game_ended");
	level endon ("stop_zombieboss");

	while(1)
	{
		wait level.zombieBossTimer;
		AllPlayerMessageMiddle("^3MegaZombie ^1timer is up!");
		HandleZombieBossDeath();
	}
}

CheckZombieBossHealth()
{
	level endon ("game_ended");
	level endon ("stop_zombieboss");
	level endon ("stop_zombieland");

	level.zombieBossHealthLocal = level.zombieBossHealth;

	while(1)
	{
		self waittill ( "damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags );
		if(attacker.team != "axis" && self.isInMegaZombie == true)
		{
			level.zombieBossHealthLocal -= 1;
		}

		if (level.zombieBossHealthLocal < 5)
		{
			level thread HandleZombieBossDeath();
		}
		wait .01;
	}
}

ZombieBossFire()
{
	self endon ("disconnect");
	self endon ("death");
	level endon ("stop_zombieboss");
	level endon ("game_ended");

	wait .2;

	self TakeAllWeapons();
	wait 0.5;
	self GiveWeapon(level.megaZombieWeapon);
	self SetWeaponAmmoClip(level.megaZombieWeapon, 1);
	self SetWeaponAmmoStock(level.megaZombieWeapon, 0);
	wait .1;
	self SwitchToWeapon(level.megaZombieWeapon);
	while(1)
	{
		self waittill("weapon_fired");
		self TakeWeapon(level.zombieStartWeapon);

		if (self GetCurrentWeapon() == level.megaZombieWeapon && self.isInMegaZombie == true)
		{
			my = self GetTagOrigin("j_head");
			trace = BulletTrace(my, my + AnglesToForward(self GetPlayerAngles())*100000,true,self)["position"];
			PlayFx(level.expBull, trace);
			self PlaySound(level.megaZombieGunSound);
			RadiusDamage(trace, 50, 20, 19, self);
			EarthQuake(0.9, 2, self.origin, 30);
			wait 1.5;
			self SetWeaponAmmoClip(level.megaZombieWeapon, 1);
		}
	}
}

HandleZombieBossDeath()
{
	// Reset Fog
	SetExpFog(200, 800, 0.5, 0.5, 0.5, 10);

	// Handle Player end MegaZombie
	for ( i = 0; i < level.players.size; i++ )
	{
		p = level.players[i];
		if (p IsHuman() == false)
		{
			p.phealth = level.resetHealth;
			p.maxhealth = p.phealth;
			p.health = p.maxhealth;
			p.isInMegaZombie = false;
			p Suicide();
			p UnLink(level.mzs);
		}
		else
		{
			p PlayerMessageMiddle("^5You survided the ^1MegaZombie^2!");
			p PlayerMessageMiddle("^2You won $" + level.megaZombieSurvivor + "!");
			p AddMoney(level.megaZombieSurvivor);
		}
	}

	// Clean-up MegaZombie
	level.mzs Delete();
	level notify ("stop_zombieboss");

	// Start new MegaZombie in X seconds
	level.zombieBoss = false;
	wait 240;
	level.zombieBossFinal = false;
}

// MegaZombie Utils
GiveMegaZombieClass()
{
	self ClearPerks();
    self TakeAllWeapons();
	wait 0.1;
    self GiveWeapon(level.zombieStartWeapon);
    self SwitchToWeapon(level.zombieStartWeapon);
    self SetWeaponAmmoStock(level.zombieStartWeapon, 8);
    self SetWeaponAmmoClip(level.zombieStartWeapon, 8);
}