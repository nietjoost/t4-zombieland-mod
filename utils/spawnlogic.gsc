// SPAWN OBJECTS Logic
SpawnFlag(pos1, pos2)
{
    // Spawn model
    startflag = Spawn("script_model", pos1);
    startflag SetModel(level.flag);
    startflag.pos2 = pos2;
    level.flags[0] = startflag;

    // Spawn FX
    PlayFX(level.flagFx, pos1);

    // Spawn UI Icon
    objective_add(level.objectId, "active", "invisible", 0, 0, 0);
    objective_icon(level.objectId, "waypoint_flag");
    objective_state(level.objectId, "active");
    objective_position(level.objectId, pos1);
    level.objectId++;
}


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