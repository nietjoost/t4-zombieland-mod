// Check Flags
CheckFlags(flag)
{
    level endon ("stop_zombieland");
    level endon ("game_ended");

    while (1)
    {
        wall_trigger_hint = undefined;
        wall_trigger_hint = Spawn( "trigger_radius", flag.pos1, 0, 32, 32);

        wall_trigger_hint waittill("trigger", player);
        player SetOrigin(flag.pos2);
    }
}