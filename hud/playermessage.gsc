// Say player message
playermessagemiddle(msg)
{
    self iPrintlnBold(msg);
}

allplayermessagemiddle(msg)
{
    for ( i = 0; i < level.players.size; i++ )
    {	
        p = level.players[i];
        p thread playermessagemiddle(msg);
        wait .5;
    }
}

// Say player message left under
playermessageleftunder(msg)
{
    self iPrintln(level.prefix + msg);
}