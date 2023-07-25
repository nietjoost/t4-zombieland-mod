#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;

AllPlayersKilled()
{
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];

        if (p IsHost())
            continue;

        p suicide();
    }

    self thread PlayerMessageLeftUnder("All players have been ^1killed!");
}

StopZombieLand()
{
    if (level.stopZombieLand)
    {
        self thread PlayerMessageLeftUnder("The ^1 ZombieLand ^5 mod ^7is already stopped!");
        return;
    }

    // Stopping while loops and message
    level thread AllPlayerMessageLeftUnder("^1ZombieLand ^5mod ^7was running but is stopped by the Host!");
    level notify("stop_zombieland");
    self thread PlayerMessageLeftUnder("Stopping the ^1ZombieLand ^5mod!");

    // Stopping the messages and functions
    level.stopZombieLand = true;
    level thread RemoveAllHud();

    // Delete the mini-map icons
    for ( i = 0; i < level.objectId; i++ )
    {
        objective_delete(i);
    }

    // Delete all spawned models
    for ( i = 0; i < level.spawnedModelsCount; i++ )
    {
        model = level.spawnedModels[i];
        model Delete();
    }

    // Resetting DVar
    SetDvar("sv_cheats", level.sv_cheats);
    SetDvar("ui_allow_teamchange", level.ui_allow_teamchange);
	SetDvar("ui_allow_classchange", level.ui_allow_classchange);
	SetDvar("party_autoteams", level.party_autoteams);
	SetDvar("scr_teambalance", level.scr_teambalance);
	SetDvar("g_TeamName_Allies", level.g_TeamName_Allies);
	SetDvar("g_TeamName_Axis", level.g_TeamName_Axis);
	SetDvar("g_customTeamName_Allies", level.g_customTeamName_Allies);
	SetDvar("g_customTeamName_Axis", level.g_customTeamName_Axis);
	SetDvar("g_teamColor_Allies", level.g_teamColor_Allies);
	SetDvar("g_ScoresColor_Allies", level.g_ScoresColor_Allies);
	SetDvar("g_teamColor_Axis", level.g_teamColor_Axis);
	SetDvar("g_ScoresColor_Axis", level.g_ScoresColor_Axis);
	SetDvar("g_TeamIcon_Allies", level.g_TeamIcon_Allies);
	SetDvar("g_TeamIcon_Axis", level.g_TeamIcon_Axis);

    self thread PlayerMessageLeftUnder("Stopped all ^1ZombieLand ^5mod ^7 related stuff!");
}