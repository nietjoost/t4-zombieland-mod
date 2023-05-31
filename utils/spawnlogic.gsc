// SPAWN OBJECTS Logic
SpawnFlag(pos1, pos2)
{
    // Spawn model
    startflag = Spawn("script_model", pos1);
    startflag SetModel(level.flag);

    // Spawn FX
    PlayFX(level.flagFx, pos1);
}