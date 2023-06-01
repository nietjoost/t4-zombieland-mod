// SERVER Settings
SetupSettings()
{
    // Variables
    level.started = false;
    level.enoughPlayers = false;
	level.flags = [];
	level.ziplines = [];
	level.objectId = 1;

    // Game settings
	SetDvar("sv_cheats", "1");
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


// Global level settings
GlobalSetting()
{
	level.flag = "prop_flag_japanese";
	level.flagFx = LoadFX("misc/ui_flagbase_red");
}


// PRECACHE Objects
PreCache()
{
	PrecacheModel(level.flag);
}