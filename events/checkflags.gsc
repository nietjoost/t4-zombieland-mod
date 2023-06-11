// Check Flags
CheckFlags(flag)
{
    while (1)
    {
        wall_trigger_hint = Spawn( "trigger_radius", flag.pos1, 0, 32, 32);  
        wall_trigger_hint waittill("trigger", player);
        player SetOrigin(flag.pos2);
    }
}