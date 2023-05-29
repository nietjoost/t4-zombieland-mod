SetupSettings()
{
    // Variables
    level.started = false;
    level.enoughPlayers = false;
    level.totalPlayers = 0;
	level.playersList = [];

    // Game settings
    SetDvar("ui_allow_teamchange", "0");
	SetDvar("ui_allow_classchange", "0");
	SetDvar("party_autoteams", 0);
	SetDvar("scr_teambalance", 0);
	SetDvar("g_TeamName_Allies", "Humans");
	SetDvar("g_TeamName_Axis", "Zombies");
	SetDvar("g_customTeamName_Allies", "Humans");
	SetDvar("g_customTeamName_Axis", "Zombies");
	SetDvar("g_teamColor_Allies", "0 1 1");
	SetDvar("g_ScoresColor_Allies", "0 1 1");
}