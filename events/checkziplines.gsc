// CHECK Ziplines
CheckZiplines()
{
    for(;;) 
    {
        wait 0.1;
        for ( i = 0; i < level.players.size; i++ )
        {	
            for ( k = 0; k < level.ziplines.size; k++ )
            {
                p = level.players[i];
                z = level.ziplines[k];

                //Set the hintstring
                if (Distance(p.origin, z.origin) <= 50)
                {
                    p.hint = "^5Hold [{+melee}] To Use ZipLine";

                    // Check for BUTTON press
                    if (p MeleeButtonPressed())
                    {
                        wait 0.5;
                        if (p MeleeButtonPressed())
                        {
                            p thread HandleZipline(z);
                        }
                    }
                }

                // Remove the hintstring
                if (Distance(p.origin, z.origin) > 50 && Distance(p.origin, z.origin) < 200)
                {
                    p.hint = "";
                }
            }
        }
    }
}


//ZiplineLogic
HandleZipline(zipline)
{
	ziplineEnt = Spawn("script_origin", self.origin);
	self linkTo(ziplineEnt);
	ziplineEnt moveTo(zipline.pos2, 2);
    wait 2;
    self unlink();
    ziplineEnt Delete();
}