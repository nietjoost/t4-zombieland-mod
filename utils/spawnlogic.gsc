#include scripts\mp\events\checkflags;

// SPAWN OBJECTS Logic
SpawnFlag(pos1, pos2, showIcon)
{
    if (!IsDefined(showIcon))
        showIcon = true;

    // Spawn model
    startFlag = Spawn("script_model", pos1);
    startFlag SetModel(level.flag);
    startFlag.pos1 = pos1;
    startFlag.pos2 = pos2;

    // Spawn FX
    fx = PlayFX(level.flagFx, pos1);
    level.spawnedModels[level.spawnedModelsCount] = fx;
	level.spawnedModelsCount++;

    // Spawn UI Icon
    if (showIcon)
    {
        objective_add(level.objectId, "active", "invisible", 0, 0, 0);
        objective_icon(level.objectId, "waypoint_flag");
        objective_state(level.objectId, "active");
        objective_position(level.objectId, pos1);
        level.objectId++;
    }
    
    //Check TP
    level thread CheckFlags(startFlag);

    level.spawnedModels[level.spawnedModelsCount] = startFlag;
	level.spawnedModelsCount++;
}


// SPAWN ZipLine
SpawnZipline(pos1, pos2)
{
    level thread SpawnZiplineBoth(pos1, pos2);
    wait 0.1;
    level thread SpawnZiplineBoth(pos2, pos1);
}

SpawnZiplineBoth(pos1, pos2)
{
    //Spawn hint string [needs model]
    zipline = Spawn("script_model", pos1);
    zipline SetModel(level.zipline);
    zipline.pos2 = pos2;  
    level.ziplines[level.ziplines.size] = zipline;

    // Spawn FX
    fx = PlayFX(level.ziplineFx, pos1);
    level.spawnedModels[level.spawnedModelsCount] = fx;
	level.spawnedModelsCount++;

    // Spawn UI Icon
    objective_add(level.objectId, "active", "invisible", 0, 0, 0);
    objective_icon(level.objectId, "waypoint_flag");
    objective_state(level.objectId, "active");
    objective_position(level.objectId, pos1);
    level.objectId++;

    level.spawnedModels[level.spawnedModelsCount] = zipline;
	level.spawnedModelsCount++;
}