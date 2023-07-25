// CHECK Ziplines
CheckZiplines()
{
    for(;;) 
    {
        level endon("stop_zombieland");

        wait 0.2;
        for ( i = 0; i < level.players.size; i++ )
        {	
            for ( k = 0; k < level.ziplines.size; k++ )
            {
                p = level.players[i];
                z = level.ziplines[k];

                //Set the hintstring
                if (Distance(p.origin, z.origin) <= 50 && p.usingZipline == false)
                {
                    p.hint = "^5Hold ^1[{+melee}] ^5to use the ZipLine";

                    // Check for BUTTON press
                    if (p MeleeButtonPressed())
                    {
                        wait 0.1;
                        if (p MeleeButtonPressed())
                        {
                            p thread HandleZipline(z);
                        }
                    }
                }

                // Remove the hintstring
                if (Distance(p.origin, z.origin) > 50 && Distance(p.origin, z.origin) < 300)
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
    self.usingZipline = true;
    delay = Distance(self.origin, zipline.pos2) / 700;
	ziplineEnt = Spawn("script_origin", self.origin);
	self linkTo(ziplineEnt);
	ziplineEnt moveTo(zipline.pos2, delay);
    wait delay+0.2;
    self unlink();
    ziplineEnt Delete();
    self.usingZipline = false;
}