// Say player message
playermessagemiddle(msg)
{
    self iPrintlnBold(msg);

    //WEAPON DEBUG
    //self iPrintln(self getCurrentWeapon());
}

allplayermessagemiddle(msg)
{
    for ( i = 0; i < level.players.size; i++ )
    {	
        p = level.players[i];
        p thread playermessagemiddle(msg);
    }
}

// Say player message left under
playermessageleftunder(msg)
{
    self iPrintln(level.prefix + msg);
}