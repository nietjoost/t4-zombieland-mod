// Say player message
PlayerMessageMiddle(msg)
{
    self iPrintlnBold(msg);

    //WEAPON DEBUG
    //self iPrintln(self getCurrentWeapon());
}

AllPlayerMessageMiddle(msg)
{
    for ( i = 0; i < level.players.size; i++ )
    {	
        p = level.players[i];
        p thread PlayerMessageMiddle(msg);
    }
}

// Say player message left under
PlayerMessageLeftUnder(msg)
{
    self iPrintln(level.prefix + msg);
}