// Check Flags
CheckFlags(flag)
{
    while (1)
    {
        level endon("stop_zombieland");
        
        wall_trigger_hint = Spawn( "trigger_radius", flag.pos1, 0, 32, 32); 

        level.spawnedModels[level.spawnedModelsCount] = wall_trigger_hint;
	    level.spawnedModelsCount++;

        wall_trigger_hint waittill("trigger", player);
        player SetOrigin(flag.pos2);
    }
}