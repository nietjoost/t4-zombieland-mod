// Check Flags
CheckFlags(flag)
{
    level endon ("stop_zombieland");

    while (1)
    {
        wall_trigger_hint = Spawn( "trigger_radius", flag.pos1, 0, 32, 32);
        level.spawnedModels[level.spawnedModels.size] = wall_trigger_hint;

        wall_trigger_hint waittill("trigger", player);
        player SetOrigin(flag.pos2);
    }
}