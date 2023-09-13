// SERVER Settings
SetupSettings()
{
    // Variables
    level.started = false;
    level.enoughPlayers = false;
	level.ended = false;
	level.ziplines = [];
	level.buyWeapons = [];
	level.objectId = 1;
	level.stopZombieLand = false;
	level.spawnedModels = [];
	level.spawnedModelsCount = 0;

	// ICONS
	PrecacheShader("specialty_gas_mask");
	PrecacheShader("specialty_exposeenemy");

	// Save Game settings for reset
	level.sv_cheats = GetDvar("sv_cheats");
    level.ui_allow_teamchange = GetDvar("ui_allow_teamchange");
	level.ui_allow_classchange = GetDvar("ui_allow_classchange");
	level.party_autoteams = GetDvar("party_autoteams");
	level.scr_teambalance = GetDvar("scr_teambalance");
	level.g_TeamName_Allies = GetDvar("g_TeamName_Allies");
	level.g_TeamName_Axis = GetDvar("g_TeamName_Axis");
	level.g_customTeamName_Allies = GetDvar("g_customTeamName_Allies");
	level.g_customTeamName_Axis = GetDvar("g_customTeamName_Axis");
	level.g_teamColor_Allies = GetDvar("g_teamColor_Allies");
	level.g_ScoresColor_Allies = GetDvar("g_ScoresColor_Allies");
	level.g_teamColor_Axis = GetDvar("g_teamColor_Axis");
	level.g_ScoresColor_Axis = GetDvar("g_ScoresColor_Axis");
	level.g_TeamIcon_Allies = GetDvar("g_TeamIcon_Allies");
	level.g_TeamIcon_Axis = GetDvar("g_TeamIcon_Axis");

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
	SetDvar("g_teamColor_Allies", "0 1 0");
	SetDvar("g_ScoresColor_Allies", "0 1 0");
	SetDvar("g_teamColor_Axis", "1 0 0");
	SetDvar("g_ScoresColor_Axis", "1 0 0");
	SetDvar("g_TeamIcon_Allies", "specialty_gas_mask");
	SetDvar("g_TeamIcon_Axis", "specialty_exposeenemy");
	SetDvar("bg_fallDamageMinHeight", 99999999);
	SetDvar("bg_fallDamageMaxHeight ", 99999999);

	//SetExpFog(80, 612, 1, 0, 0, 10);
}


// Global level settings
GlobalSetting()
{
	level.flag = "prop_flag_japanese";
	level.flagFx = LoadFX("misc/ui_flagbase_blue");
	level.zipline = "prop_flag_neutral";
	level.ziplineFx = LoadFX("misc/ui_flagbase_red");
	level.weaponFx = LoadFX("misc/ui_flagbase_gold");
	level.boost = "prop_flag_american";
	level.boostFx = LoadFX("misc/ui_flagbase_silver");

	level.collision = "collision_wall_32x32x10";
	level.collisionModel = "global_barrel_scummy";
}


// PRECACHE Objects
PreCache()
{
	// MODELS
	PrecacheModel(level.flag);
	PrecacheModel(level.zipline);
	PrecacheModel(level.boost);

	PrecacheModel(level.collision);
	PrecacheModel(level.collisionModel);
}