// CHECK Hintstring
CheckHintString()
{
    for(;;) 
    {
        level endon ("stop_zombieland");
        
        wait 0.1;

        for ( i = 0; i < level.players.size; i++ )
        {	
            p = level.players[i];
            p thread SetHintString();
        }
    }
}


// Set player text on screen
SetHintString()
{
    // Check for running mod
	if (level.stopZombieLand == true)
    {
		return;
    }

    self.hint_string Destroy();

    self.hint_string = NewClientHudElem(self);

    self.hint_string.alignX = "center";
    self.hint_string.alignY = "center";
	self.hint_string.horzAlign = "center";
	self.hint_string.vertAlign = "middle";
    self.hint_string.y = 60;
    self.hint_string.fontscale = 1.7;
    self.hint_string.font = "objective";
    self.hint_string.archived = false;
    self.hint_string.color = (0, 0, 1);
    self.hint_string.hidewhendead = true;
    self.hint_string.hidewheninmenu = true;
    self.hint_string SetText(self.hint);
}