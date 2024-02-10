#include scripts\mp\menu\menubuylogic;
#include scripts\mp\hud\playermessage;

CreateWallWeapon(model, location, price)
{
    weapon = Spawn("script_model", location + (0, 0, 50));
    weapon SetModel(getWeaponModel(model));
    weapon.price = price;
    weapon.name = model;
    level.spawnedModels[level.spawnedModels.size] = weapon;

	// Spawn FX
    fx = PlayFX(level.weaponFx, location);
    level.spawnedModels[level.spawnedModels.size] = fx;

    // Handle in-game
    weapon thread RotateWallWeapon();
    weapon thread WatchBuyWallWeapon();
}

WatchBuyWallWeapon()
{
    level endon ("game_ended");
    level endon ("stop_zombieland");
    
    for (;;)
    {
        for ( i = 0; i < level.players.size; i++ )
        {
            p = level.players[i];

            p thread WatchBuyWallWeaponPlayer(self);
        }
        wait 0.5;
    }
}

WatchBuyWallWeaponPlayer(weapon)
{
    if (self.type == "zombie")
    {
        return;
    }

    // Set the hintstring
    if (Distance(self.origin, weapon.origin) < 70)
    {
        if (self hasWeapon(self.name))
        {
            self.hint = "^5Hold ^1[{+activate}] ^5to buy ammo ^7[Cost: ^3" + weapon.price + "^7]";
        }
        else
        {
            self.hint = "^5Hold ^1[{+activate}] ^5to buy weapon ^7[Cost: ^3" + weapon.price + "^7]";
        }

        // Check for BUTTON press
        if (self UseButtonPressed())
        {
            wait 0.1;
            if (self UseButtonPressed())
            {
                if (self.type == "zombie")
                {
                    self thread PlayerMessageLeftUnder("Zombies can not buy a weapon!");
                    self.hint = "";
                    return;
                }

                if (self thread CheckMoney(weapon.price))
                {
                    return;
                }

                self PlaySound(level.buySound);
                if (self hasWeapon(weapon.name))
                {
                    self thread GiveBuyWeapon(weapon.name, "You bought ammo!");
                    self.hint = "";
                }
                else
                {
                    self thread GiveBuyWeapon(weapon.name, "You bought the weapon!");
                    self.hint = "";
                }

                self.hint = "^5Hold ^1[{+activate}] ^5to buy ammo";
                wait 2;
            }
        }
    }

    // Remove the hintstring
    if (Distance(self.origin, weapon.origin) > 70 && Distance(self.origin, weapon.origin) < 400)
    {
        self.hint = "";
    }
}

// Rotate the buy weapon
RotateWallWeapon()
{
    level endon ("game_ended");

	while(1)
	{
  		self rotateYaw(360,7.5);
		wait ((7.5)-0.1);
	}
}