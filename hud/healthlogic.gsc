// HEALTH logic
CreateHealthHUD()
{
    self.hud_health Destroy();

    self.hud_health = NewClientHudElem(self);
    self.hud_health.alignX = "left";
	self.hud_health.horzAlign = "left";
	self.hud_health.vertAlign = "center";
    self.hud_health.x = 20;
    self.hud_health.y = 140;
    self.hud_health.font = "objective";
    self.hud_health.fontscale = 2;
    self.hud_health.archived = false;
    self.hud_health.color = (1, 0, 0);
    self.hud_health.hidewhendead = true;
    self.hud_health.hidewheninmenu = true;
    self.hud_health SetText("Health: " + self.health);
}

// ADD money
AddHealth(localHealth)
{
    self.health += localHealth;
    self thread CreateHealthHUD();
}

// REMOVE money
RemoveHealth(localHealth)
{
    self.health -= localHealth;
    self thread CreateHealthHUD(localHealth);
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