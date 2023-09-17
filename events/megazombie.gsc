#include scripts\mp\hud\playermessage;
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
			zpos = 1;

			// Set ZombieBoss position
			for ( i = 0; i < level.players.size; i++ )
			{	
				p = level.players[i];
				if (p IsHuman() == false) 
				{
					if (zpos == 1) level.zbdriver = p;
					p.zpos = zpos;
					zpos++;
					p FreezeControls(true);
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

			p SetOrigin(p.newPos);
			p SetPlayerAngles((0, 0, 0));

			if(p.zpos != 0)	p LinkTo(level.mzs);

			wait 5;
			level.zbdriver FreezeControls(false);
		}
	}
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