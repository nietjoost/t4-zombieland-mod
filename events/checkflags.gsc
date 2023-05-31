// Check Flags
CheckFlags()
{
    for(;;) 
    {
        wait 0.1;

        for ( i = 0; i < level.players.size; i++ )
        {	
            for ( k = 0; k < level.flags.size; k++ )
            {
                p = level.players[i];
                f = level.flags[k];
                if (Distance(p.origin, f.origin) <= 50)
                {
                    p SetOrigin(f.pos2);
                }
            }
        }
    }
}