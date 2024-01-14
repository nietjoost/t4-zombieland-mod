// Say player message
PlayerMessageMiddle(msg)
{
    self iPrintlnBold(msg);

    // WEAPON DEBUG
    //self iPrintln(self getCurrentWeapon());
}

AllPlayerMessageMiddle(msg)
{
    // Check for running mod
	if (level.stopZombieLand == true)
	{
		return;
	}

    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        p thread PlayerMessageMiddle(msg);
    }
}

TeamPlayerMessageMiddle(team, msg)
{
    // Check for running mod
	if (level.stopZombieLand == true)
	{
		return;
	}

    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (self.pers["team"] == team)
        {
            p thread PlayerMessageMiddle(msg);
        }
    }
}

// Say player message left under
PlayerMessageLeftUnder(msg)
{
    self iPrintln(level.prefix + msg);
}

AllPlayerMessageLeftUnder(msg)
{
    // Check for running mod
	if (level.stopZombieLand == true)
	{
		return;
	}

    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        p thread PlayerMessageLeftUnder(msg);
    }
}

// Say player type writer text
PlayerTypeWriterText(msg)
{
    self thread maps\mp\gametypes\_hud_message::hintMessage(msg);
}

AllPlayerTypeWriterText(msg)
{
    // Check for running mod
	if (level.stopZombieLand == true)
	{
		return;
	}

    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        p thread PlayerTypeWriterText(msg);
    }
}