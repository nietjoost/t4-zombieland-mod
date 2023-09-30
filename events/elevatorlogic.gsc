// Monitor the elevator
ElevatorMonitor(solid, start, end, duration, waitduration)
{
	while (IsDefined(self))
    {
        level endon ("stop_zombieland");

    	if (self.origin == start)
        {
			self MoveTo(end, duration);
            solid MoveTo(end, duration);
        }
		if (self.origin == end)
        {
			self MoveTo(start, duration);
            solid MoveTo(end, duration);
        }
		wait duration;
		wait waitduration;
    }
}