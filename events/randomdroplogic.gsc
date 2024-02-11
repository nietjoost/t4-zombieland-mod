#include scripts\mp\hud\playermessage;
#include scripts\mp\killstreaks\jetpack;
#include scripts\mp\utils\utils;
#include scripts\mp\utils\player;

// Random drop logic
WatchRandomDrop()
{
    level endon ("stop_zombieland");
    level endon ("game_ended");

    // Wait 1 minute before giving random drops
    wait 60;

    // Start Random Drops
    while(1)
    {
        // Block messages if game is ended
        if (level.ended == true)
        {
            continue;
        }

        // Random drop logic
        for ( i = 0; i < level.players.size; i++ )
        {
            p = level.players[i];

            p thread PlayerMessageMiddle("^5You got a random drop!");

            if (p IsHuman())
            {
                p thread GiveHumanDrop();
            }
            else
            {
                p thread GiveZombieDrop();
            }
        }

        wait RandomIntRange(45, 75);
    }
}

GiveHumanDrop(randomInt)
{
    randomIntHuman = RandomIntRange(1, 10);

    if (randomIntHuman == 1)
        self GiveInvisible(10);

    if (randomIntHuman == 2)
        self GivePlayerMaxAmmo();

    if (randomIntHuman == 3)
        self GivePlayerHealth(25);

    if (randomIntHuman == 4)
        self GivePlayerMoney(25);

    if (randomIntHuman == 5)
        self GivePlayerSteelSkin(1500);

    if (randomIntHuman == 6)
        self GiveRandomPerk();

    if (randomIntHuman == 7)
        self GiveRandomWeapon();

    if (randomIntHuman == 8)
        self GiveExplosiveSniper();

    if (randomIntHuman == 9)
        GivePlayerBurn("zombie", 5);
}

GiveZombieDrop(randomInt)
{
    randomIntZombie = RandomIntRange(1, 9);

    if (randomIntZombie == 1)
        self GiveInvisible(10);

    if (randomIntZombie == 3)
    {
        if (self.isInMegaZombie == true)
        {
            self GivePlayerMoney(25);
        }
        else
        {
            self GivePlayerHealth(50);
        }
    }

    if (randomIntZombie == 4)
        self GivePlayerMoney(25);

    if (randomIntZombie == 5)
    {
        if (self.isInMegaZombie == true)
        {
            self GivePlayerMoney(25);
        }
        else
        {
            self GivePlayerSteelSkin(300);
        }
    }

    if (randomIntZombie == 6)
        self GiveRandomPerk();

    if (randomIntZombie == 7)
        GivePlayerBurn("human", 10);

    if (randomIntZombie == 8)
        GiveFreeJetPack();
}