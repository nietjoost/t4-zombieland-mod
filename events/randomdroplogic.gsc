#include scripts\mp\hud\playermessage;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\player;

// Random drop logic
WatchRandomDrop()
{
    // Wait 1 minute before giving random drops
    wait 60;

    // Start Random Drops
    while(1)
    {
        level endon ("stop_zombieland");

        for ( i = 0; i < level.players.size; i++ )
        {	
            p = level.players[i];
            randomInt = RandomIntRange(1, 4);

            p thread PlayerMessageMiddle("^5You got a random drop!");

            if (p IsHuman())
            {
                p thread GiveHumanDrop(randomInt);
            }
            else
            {
                p thread GiveZombieDrop(randomInt);
            }
            wait 0.1;
        }

        wait RandomIntRange(45, 75);
    }
}


GiveHumanDrop(randomInt)
{
    if (randomInt == 1)
        self GiveInvisible(10);
    
    if (randomInt == 2)
        self GivePlayerMaxAmmo();

    if (randomInt == 3)
        self GivePlayerHealth(25);
}

GiveZombieDrop(randomInt)
{
    if (randomInt == 1)
        self GiveInvisible(10);
    
    if (randomInt == 2)
        self GivePlayerMaxAmmo();

    if (randomInt == 3)
        self GivePlayerHealth(50);
}