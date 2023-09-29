#include scripts\mp\hud\playermessage;

// Broadcast messages to Players logic
Broadcast()
{
    messages = [];
    messages[0] = "Press [{+melee}] | [{+speed_throw}] at the same time to open the menu!";
    messages[1] = "You can buy items and perks in the menu!";
    messages[2] = "Be last alive to win the game!";
    messages[3] = "^1Created by ^5RooieRonnie^1!";
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