#include scripts\mp\menu\menubuylogic;

// HEALTH logic
CreateHealthHUD()
{
    self.hud_health Destroy();
    self.hud_health = undefined;

    self.hud_health = NewClientHudElem(self);
    self.hud_health.alignX = "left";
	self.hud_health.horzAlign = "left";
	self.hud_health.vertAlign = "center";
    self.hud_health.x = 20;
    self.hud_health.y = 165;
    self.hud_health.font = "objective";
    self.hud_health.fontscale = 2;
    self.hud_health.archived = false;
    self.hud_health.color = (1, 0, 0);
    self.hud_health.hidewhendead = true;
    self.hud_health.hidewheninmenu = true;
    self.hud_health SetText("Health: " + self.phealth);
}

// ADD money
AddHealth(localHealth)
{
    self.phealth += localHealth;
    self.maxhealth = self.phealth;
    self.health = self.maxhealth;
    self thread CreateHealthHUD();
}

AddHealthMenu()
{
    if (self thread CheckMoney(level.buyHealthCost))
    {
        return;
    }

    self AddHealth(level.getHealthMenu);
    self PlaySound(level.buySound);
}

AddHealthZombieMenu()
{
    if (self thread CheckMoney(level.buyHealthZombieCost))
    {
        return;
    }

    self AddHealth(level.buyHealthZombie);
    self PlaySound(level.buySound);
}

// REMOVE money
RemoveHealth(localHealth)
{
    self.phealth -= localHealth;

    if (self.phealth < 0)
    {
        self.phealth = 0;
    }
    
    self.maxhealth = self.phealth;
    self.health = self.maxhealth;
    self thread CreateHealthHUD();
}

// Watch Health logic
WatchHealth()
{
    level endon ("death");
    level endon ("stop_zombieland");
    level endon ("game_ended");

    while(1)
	{
		self waittill ( "damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags );

        // Cancel health if ZombieBoss is enabled
        if (level.zombieBoss == true)
        {
            continue;
        }

        self RemoveHealth(damage);
	}
}

// Remove all Players HUD - Health
RemoveAllHealthHud()
{
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];

        p.hud_health Destroy();
    }
}