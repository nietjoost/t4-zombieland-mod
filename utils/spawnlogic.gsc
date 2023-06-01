// SPAWN OBJECTS Logic
SpawnFlag(pos1, pos2)
{
    // Spawn model
    startflag = Spawn("script_model", pos1);
    startflag SetModel(level.flag);
    startflag.pos2 = pos2;
    level.flags[level.flags.size] = startflag;

    // Spawn FX
    PlayFX(level.flagFx, pos1);

    // Spawn UI Icon
    objective_add(level.objectId, "active", "invisible", 0, 0, 0);
    objective_icon(level.objectId, "waypoint_flag");
    objective_state(level.objectId, "active");
    objective_position(level.objectId, pos1);
    level.objectId++;
}


// SPAWN ZipLine
SpawnZipline(pos1, pos2)
{
    //Spawn hint string [needs model]
    zipline = Spawn("script_model", pos1);
    zipline SetModel(level.flag);
    zipline.pos2 = pos2;
    
    level.ziplines[level.ziplines.size] = zipline;
}