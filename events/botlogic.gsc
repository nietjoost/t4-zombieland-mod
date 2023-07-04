// BOTS logic script for testing
AddTestClients()
{
    setDvar("sv_botsPressAttackBtn", "1");
    setDvar("sv_botsRandomInput", "1");

	for(i = 0; i < 5; i++)
	{
		ent[i] = addtestclient();
		if (!isdefined(ent[i])) 
		{
		    println("Could not add test client");
		    wait 1;
			continue;
		}
	    ent[i].pers["isBot"] = true;
	    ent[i] thread TestClient("autoassign");
	}
}

TestClient(team)
{
    self endon( "disconnect" );
	while(!isdefined(self.pers["team"]))
	wait .05;
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
	classes = getArrayKeys( level.classMap );
	okclasses = [];
	for ( i = 0; i < classes.size; i++ )
	{
		if ( !issubstr( classes[i], "custom" ) && isDefined( level.default_perk[ level.classMap[ classes[i] ] ] ) )
		okclasses[ okclasses.size ] = classes[i];
	}
	assert( okclasses.size );
	while( 1 )
	{
		class = okclasses[ randomint( okclasses.size ) ];
		if ( !level.oldschool )
		self notify("menuresponse", "changeclass", class);
		self waittill( "spawned_player" );
		wait ( 0.10 );
	}
}