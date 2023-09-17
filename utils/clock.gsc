// In-game time logic
CalculateGameTime()
{
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