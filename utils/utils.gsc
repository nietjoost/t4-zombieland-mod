// Empty function
FixForfeit()
{

}

CalculateTotalHumans()
{
    humanCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (p.pers["team"] == "allies")
        {
            humanCount++;
        }
    }

    return humanCount;
}

GetPlayerHumans()
{
    humans = [];
    humansCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (p.pers["team"] == "allies")
        {
            humans[humansCount] = p;
            humansCount++;
        }
    }
    return humans;
}

CalculateTotalZombies()
{
    zombieCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (p.pers["team"] == "axis")
        {
            zombieCount++;
        }
    }

    return zombieCount;
}

GetPlayerZombies()
{
    zombies = [];
    zombiesCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (p.pers["team"] == "axis")
        {
            zombies[zombiesCount] = p;
            zombiesCount++;
        }
    }
    return zombies;
}

GetPlayerWithMostKills()
{
    winner = level.players[0];
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];
        if (p.kills > winner.kills)
        {
            winner = p;
        }
    }
    return winner;
}