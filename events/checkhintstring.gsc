// CHECK Hintstring
CheckHintString()
{
    for(;;) 
    {
        level endon("stop_zombieland");
        
        wait 0.2;

        for ( i = 0; i < level.players.size; i++ )
        {	
            p = level.players[i];
            p thread SetHintString();
        }
    }
}


// MONEY logic
SetHintString()
{
    // Check for running mod
	if (level.stopZombieLand == true)
    {
		return;
    }

    self.hint_string destroy();

    self.hint_string = newClientHudElem(self);
    self.hint_string.x = 200;
    self.hint_string.y = 175;
    self.hint_string.fontscale = 2;
    self.hint_string.archived = false;
    self.hint_string.color = (0, 0, 1);
    self.hint_string.hidewhendead = true;
    self.hint_string.hidewheninmenu = true;
    self.hint_string setText(self.hint);
}