// CHECK Hintstring
CheckHintString()
{
    level endon ("stop_zombieland");

    for(;;)
    {
        for ( i = 0; i < level.players.size; i++ )
        {
            level.players[i] thread SetHintString();
        }
        
        wait 0.1;
    }
}


// Set player text on screen
SetHintString()
{
    // Check for running mod
	if (level.stopZombieLand == true)
    {
        self.hint_string SetText("");
        self.hint_string Destroy();
        self.sub_hint_string SetText("");
        self.sub_hint_string Destroy();
		return;
    }

    self.hint_string Destroy();
    self.hint_string = undefined;
    self.hint_string = NewClientHudElem(self);
    self.hint_string.alignX = "center";
    self.hint_string.alignY = "center";
	self.hint_string.horzAlign = "center";
	self.hint_string.vertAlign = "middle";
    self.hint_string.y = 60;
    self.hint_string.fontscale = 1.7;
    self.hint_string.font = "objective";
    self.hint_string.archived = false;
    self.hint_string.hidewhendead = true;
    self.hint_string.hidewheninmenu = true;
    self.hint_string SetText(self.hint);

    self.sub_hint_string Destroy();
    self.sub_hint_string = undefined;
    self.sub_hint_string = NewClientHudElem(self);
    self.sub_hint_string.alignX = "center";
    self.sub_hint_string.alignY = "center";
	self.sub_hint_string.horzAlign = "center";
	self.sub_hint_string.vertAlign = "middle";
    self.sub_hint_string.y = 90;
    self.sub_hint_string.fontscale = 1.5;
    self.sub_hint_string.font = "objective";
    self.sub_hint_string.archived = false;
    self.sub_hint_string.hidewhendead = true;
    self.sub_hint_string.hidewheninmenu = true;
    self.sub_hint_string SetText(self.subHint);
}