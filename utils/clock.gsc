#include scripts\mp\events\gamelogic;
#include scripts\mp\hud\playermessage;

// In-game time logic
CalculateGameTime()
{
    level endon ("game_ended");

    level.seconds = 0;
    level.minutes = 0;

    while(1)
    {
        wait 1;
        level.seconds++;
		if(level.seconds == 60)
        {
			level.minutes++;
			level.seconds = 0;
		}
	}
}

CalculateGameTimeEndGame()
{
    wait level.gametime - 5;

    if (level.ended == true)
    {
        return;
    }
    level notify("game_ended");
    level.ended = true;

    // Messages and player utils
    AllPlayerTypeWriterText("^2The ^1Humans ^2have won!");
    level thread EndGameLogic();
}