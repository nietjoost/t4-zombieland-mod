#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\events\gamelogic;
#include scripts\mp\utils\utils;

// Mega ZombieCode
WatchZombieBoss()
{
	while(1)
	{
		level endon ("stop_zombieland");

		// Check if enough Zombies
		if (CalculateTotalZombies() < 3 || level.zombieBoss == true || level.zombieBossFinal == true)
		{
			wait 60;
		}
		else
		{
			// Set ZombieLand Settings
			level.zombieBoss = true;
			level.zombieBossFinal = true;
			SetExpFog(200, 1000, 0.5, 0.4, 0.4, 6);
			zpos = 0;

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
				p TakeWeapon("colt_mp");
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
		p.phealth = 99999;
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
	while(1)
	{
		level endon ("stop_zombieboss");
		wait level.zombieBossTimer;
		AllPlayerMessageMiddle("^3MegaZombie ^1timer is up!");
		HandleZombieBossDeath();
	}
}

CheckZombieBossHealth()
{
	level.zombieBossHealthLocal = level.zombieBossHealth;

	while(1)
	{
		level endon ("stop_zombieboss");
		level endon ("stop_zombieland");

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

	wait .2;

	self GiveWeapon("357magnum_mp");
	self SetWeaponAmmoClip("357magnum_mp", 1);
	self SetWeaponAmmoStock("357magnum_mp", 0);
	wait .1;
	self SwitchToWeapon("357magnum_mp");
	while(1)
	{	
		self waittill("weapon_fired");
		my = self GetTagOrigin("j_head");
		trace = BulletTrace(my, my + anglestoforward(self getplayerangles())*100000,true,self)["position"];
		Playfx(level.expBull, trace);
		self PlaySound("artillery_impact");
		RadiusDamage(trace, 100, 51, 20, self);
		EarthQuake(1.5, 1, self.origin, 20);
		wait 1.5;
		self SetWeaponAmmoClip("357magnum_mp", 1);
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
			p PlayerMessageMiddle("^2You won $500!");
			p AddMoney(500);
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
    self GiveWeapon("colt_mp");
    self SwitchToWeapon("colt_mp");
    self SetWeaponAmmoStock("colt_mp", 8);
    self SetWeaponAmmoClip("colt_mp", 8);
}