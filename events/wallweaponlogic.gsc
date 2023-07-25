#include scripts\mp\menu\menubuylogic;
#include scripts\mp\hud\playermessage;

CreateWallWeapon(model, location, price)
{
    weapon = Spawn("script_model", location + (0, 0, 50));
    weapon SetModel(getWeaponModel(model));

    weapon.price = price;
    weapon.name = model;

    level.buyWeapons[level.buyWeapons.size] = weapon;
   	level.amountofmodels ++;

	// Spawn FX
    PlayFX(level.weaponFx, location);

    // Handle in-game
    weapon thread RotateWallWeapon(7.5);
}

HandleWallWeapon()
{
    for(;;) 
    {
        level endon("stop_zombieland");
        
        wait 0.2;
        for ( i = 0; i < level.players.size; i++ )
        {	
            for ( k = 0; k < level.buyWeapons.size; k++ )
            {
                p = level.players[i];
                b = level.buyWeapons[k];

                //Set the hintstring
                if (Distance(p.origin, b.origin) <= 70)
                {
                    if (p hasWeapon(b.name))
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
                            if (p.type == "zombie")
                            {
                                p thread PlayerMessageLeftUnder("Zombies can not buy a weapon!");
                                p.hint = "";
                                return;
                            }

                            if (p thread CheckMoney(b.price))  
                            {  
                                return;
                            }
                            
                            if (p hasWeapon(b.name))
                            {
                                p thread GiveBuyWeapon(b.name, "You bought ammo!");
                            }
                            else
                            {
                                p thread GiveBuyWeapon(b.name, "You bought the weapon!");
                            }
                            
                            p.hint = "^5Hold ^1[{+activate}] ^5to buy ammo";
                            wait 0.2;
                        }
                    }
                }

                // Remove the hintstring
                if (Distance(p.origin, b.origin) > 70 && Distance(p.origin, b.origin) < 300)
                {
                    p.hint = "";
                }
            }
        }
    }
}

// Rotate the buy weapon
RotateWallWeapon(duration)
{
	for(;;)
	{
  		self rotateYaw(360,duration);
		wait ((duration)-0.1);
	}
}