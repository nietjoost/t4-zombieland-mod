// SERVER Settings
SetupSettings()
{
	// Variables you can change
	level.gametime = 600;
	level.preLobbyTimer = 30; // in seconds
	level.humanStartMoney = 100;
	level.humanKillMoney = 50;
	level.humanSurvivingBonus = 25;
	level.zombieStartMoney = 50;
	level.zombieKillMoney = 25;
	level.rampageExtraCash = 50;
	level.wallWeaponCost = 300;
	level.zombieBossHealth = 99999;
	level.zombieBossTimer = 60;
	level.megaZombieSurvivor = 300;
	level.doorHealth = 100;
	level.doorDamage = 7.5;
	level.doorDamageCost = 25;
	level.doorRepairCost = 600;
	level.resetHealth = 100;
	level.buyHealthCost = 100;
	level.getHealthMenu = 50;
	level.buyHealthZombie = 25;
	level.mysteryBoxCost = 950;
	level.uavCost = 200;
	level.artilleryCost = 400;
	level.dogsCost = 600;
	level.freezeZombiesCost = 300;
	level.blockZiplinesCost = 300;
	level.slowerZombiesCost = 200;
	level.buyHealthZombieCost = 25;
	level.buyGrenadeCost = 125;
	level.buyMaxAmmoCurrentWeapon = 200;
	level.buyMaxAmmoAllWeapons = 500;
	level.buyTeleport = 500;
	level.buyInstaKill = 400;
	level.buyInvisible = 100;
	level.buyJetPack = 800;
	level.buyJetPackZombie = 100;
	level.BuyPredator = 200;
	level.buyIncreaseSpeed = 500;
	level.addBots = true;
	level.predatorInUse = false;
	
	level.playerStartWeapon = "mp40_mp";
	level.zombieStartWeapon = "colt_mp";
	level.tacticalInsertion = "satchel_charge_mp";
	level.explosiveSniper = "ptrs41_mp";
	level.megaZombieWeapon = "357magnum_mp";
	level.explosiveGunSound = "artillery_impact";
	level.endGameSound = "mp_defeat";
	level.noMoneySound = "ui_mp_suitcasebomb_timer";
	level.upgradeSound = "mp_level_up";
	level.buySound = "carbine_first_raise";
	level.megaZombieSound = "veh_explo_small";
	level.artilleryLaunchSound = "artillery_launch";
	level.fupppSound = "flare_exp";
	level.team1Icon = "specialty_gas_mask";
	level.team2Icon = "specialty_exposeenemy";

    // Variables
    level.started = false;
    level.enoughPlayers = false;
	level.ended = false;
	level.ziplines = [];
	level.objectId = 1;
	level.stopZombieLand = false;
	level.spawnedModels = [];
	level.zombieBoss = false;
	level.zombieBossFinal = false;
	level.buyZiplineBlock = false;
	level.buySlowerZombies = false;

	// ICONS
	PrecacheShader(level.team1Icon);
	PrecacheShader(level.team2Icon);
	PrecacheShader("tank_turret_mp");

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
	level.bg_fallDamageMinHeight = GetDvar("bg_fallDamageMinHeight");
	level.bg_fallDamageMaxHeight = GetDvar("bg_fallDamageMaxHeight ");
	level.scr_disable_weapondrop = GetDvar("scr_disable_weapondrop");

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
	SetDvar("g_TeamIcon_Allies", level.team1Icon);
	SetDvar("g_TeamIcon_Axis", level.team2Icon);
	SetDvar("bg_fallDamageMinHeight", 999999);
	SetDvar("bg_fallDamageMaxHeight ", 999999);
	SetDvar("motd ", "^3You Played COD5 Zombieland, ^2Created by RooieRonnie!");
	SetDvar("scr_tdm_scorelimit", 0);
	SetDvar("scr_showperksonspawn", 0);
	SetDvar("scr_game_hardpoints", 0); //Disable killstreaks

	// Set Fog
	SetExpFog(200, 800, 0.5, 0.5, 0.5, 10);
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
	level.expBull = loadfx("explosions/grenadeExp_concrete_1");

	level.collision = "collision_wall_32x32x10";
	level.collisionModel = "global_barrel_scummy";
	level.mysteryBoxModel = "test_sphere_silver";

	// Custom map models
	mapname = GetDvar("mapname");

	if (mapname == "mp_asylum" || mapname == "mp_bgate")
		level.collisionModel = "dest_opel_blitz_tire_front_left_dmg1";

	if (mapname == "mp_kwai" || mapname == "mp_shrine" || mapname == "mp_courtyard" 
	|| mapname == "mp_kneedeep" || mapname == "mp_makin_day" || mapname == "mp_makin"
	|| mapname == "mp_docks")
		level.collisionModel = "static_peleliu_crate_jpn_mrtr_clsd";

	if (mapname == "mp_drum")
		level.collisionModel = "static_peleliu_blackbarrel01";

	if (mapname == "mp_dome" || mapname == "mp_subway")
		level.collisionModel = "static_berlin_wood_ammobox_04";

	if (mapname == "mp_downfall" || mapname == "mp_nachtfeuer")
		level.collisionModel = "static_berlin_sandbags_lego_mdl";

	if (mapname == "mp_hangar")
		level.collisionModel = "static_peleliu_crate_jpn_mrtr_clsd";

	if (mapname == "mp_outskirts" || mapname == "mp_seelow")
		level.collisionModel = "static_seelow_hay_bale_sqr";

	if (mapname == "mp_vodka")
		level.collisionModel = "vodka_barrel";

	if (mapname == "mp_suburban")
		level.collisionModel = "static_seelow_blackbarrel";
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
	PrecacheModel(level.mysteryBoxModel);

	// ITEMS
	PrecacheItem("satchel_charge_mp");
}