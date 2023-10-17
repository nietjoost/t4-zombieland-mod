#include scripts\mp\menu\menubuylogic;
#include scripts\mp\hud\playermessage;
#include scripts\mp\utils\utils;

CreateWallWeapon(model, location, price)
{
    weapon = Spawn("script_model", location + (0, 0, 50));
    weapon SetModel(getWeaponModel(model));

    weapon.price = price;
    weapon.name = model;

    level.buyWeapons[level.buyWeapons.size] = weapon;

	// Spawn FX
    fx = PlayFX(level.weaponFx, location);
    level.spawnedModels[level.spawnedModels.size] = fx;

    // Handle in-game
    weapon thread RotateWallWeapon();
    weapon thread WatchBuyWallWeapon();
}

WatchBuyWallWeapon()
{
    while(1)
    {
        level endon ("game_ended");
        level endon ("stop_zombieland");

        humans = GetPlayerHumans();
        for ( i = 0; i < humans.size; i++ )
        {
            p = humans[i];

            //Set the hintstring
            if (Distance(p.origin, self.origin) < 70)
            {
                if (p hasWeapon(self.name))
                {
                    p.hint = "^5Hold ^1[{+activate}] ^5to buy ammo";
                }
                else
                {
                    p.hint = "^5Hold ^1[{+activate}] ^5to buy weapon";
                }

                // Check for BUTTON press
                if (p UseButtonPressed())
                {
                    wait 0.1;
                    if (p UseButtonPressed())
                    {
                        if (p thread CheckMoney(self.price))
                        {
                            return;
                        }

                        if (p HasWeapon(self.name))
                        {
                            p thread GiveBuyWeapon(self.name, "You bought ammo!");
                            p.hint = "";
                            wait 0.2;
                        }
                        else
                        {
                            p thread GiveBuyWeapon(self.name, "You bought the weapon!");
                            p.hint = "";
                            wait 0.2;
                        }

                        p.hint = "^5Hold ^1[{+activate}] ^5to buy ammo";
                    }
                }
            }

            // Remove the hintstring
            if (Distance(p.origin, self.origin) > 70 && Distance(p.origin, self.origin) < 300)
            {
                p.hint = "";
            }
            wait 0.01;
        }
    }
}

// Rotate the buy weapon
RotateWallWeapon()
{
	while(1)
	{
        level endon ("game_ended");
  		self rotateYaw(360,7.5);
		wait ((7.5)-0.1);
	}
}