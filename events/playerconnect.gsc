OnPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        self iprintlnbold("^2GSC from %localappdata%\Plutonium\storage\iw5\scripts\example.gsc");
    }
}
