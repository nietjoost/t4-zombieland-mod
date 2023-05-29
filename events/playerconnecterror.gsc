OnPlayerConnectError()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread OnPlayerSpawnedError();
    }
}

OnPlayerSpawnedError()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        self iprintlnbold(level.prefix + "^5Wrong gametype loaded!");
    }
}