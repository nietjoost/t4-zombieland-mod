#include scripts\mp\hud\playermessage;

// Broadcast messages to Players logic
Broadcast()
{
    level endon ("game_ended");

    messages = [];
    messages[0] = "Press [{+melee}] | [{+speed_throw}] at the same time to open the menu!";
    messages[1] = "You can buy items and perks in the menu!";
    messages[2] = "Be last alive to win the game!";
    messages[3] = "^1Created by ^5RooieRonnie^1!";
    messages[4] = "Every 30 seconds you get a random drop!";
    messages[5] = "You can buy kilstreaks and ammo in the shop!";
    messages[6] = "You can find teleporters, ziplines, weapons, doors and a mystery box in every map!";
    messages[7] = "^1Watch out for the explosive sniper!";
    messagesCount = 0;

    while(1)
    {
        // Block messages if game is ended
        if (level.ended == true)
        {
            continue;
        }

        // Broadcast logic
        AllPlayerMessageLeftUnder(messages[messagesCount]);
        messagesCount++;

        if (messagesCount > messages.size)
        {
            messagesCount = 0;
        }
        wait 30;
    }
}