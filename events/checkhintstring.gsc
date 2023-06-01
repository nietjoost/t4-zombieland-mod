// CHECK Hintstring
CheckHintString()
{
    for(;;) 
    {
        wait 0.1;

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
    self.hint_string destroy();

    self.hint_string = newClientHudElem(self);
    self.hint_string.font = "hudbig";
    self.hint_string.x = 150;
    self.hint_string.y = 150;
    self.hint_string.fontscale = 2.5;
    self.hint_string.archived = false;
    self.hint_string.color = (0, 0, 1);
    self.hint_string.hidewhendead = true;
    self.hint_string.hidewheninmenu = true;
    self.hint_string setText(self.hint);
}