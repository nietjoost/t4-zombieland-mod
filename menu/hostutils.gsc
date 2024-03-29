#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\healthlogic;
#include scripts\mp\events\checkhintstring;
#include scripts\mp\events\megazombie;

KillAllPlayersMenu()
{
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];

        if (p.name != level.players[0].name)
        {
            p Suicide();
        }
    }

    self thread PlayerMessageLeftUnder("All players have been ^1killed!");
}

ForceHost()
{
    // Is enabled so disable it ->
    if (level.foreHost)
    {
        level.foreHost = false;
        SetDvar("party_connectToOthers" , "1");
        SetDvar("partyMigrate_disabled" , "0");
        SetDvar("party_mergingEnabled" , "1");
        SetDvar("allowAllNAT", "0");
        self thread PlayerMessageLeftUnder("Force Host : ^1OFF");
    }
    else
    {
        level.foreHost = true;
        SetDvar("party_connectToOthers" , "0");
        SetDvar("partyMigrate_disabled" , "1");
        SetDvar("party_mergingEnabled" , "0");
        SetDvar("allowAllNAT", "1");
        self thread PlayerMessageLeftUnder("Force Host : ^2ON");
    }
}

StopZombieLand()
{
    if (level.stopZombieLand == true)
    {
        self thread PlayerMessageLeftUnder("The ^1 ZombieLand ^5 mod ^7is already stopped!");
        level.zombieBoss = false;
        return;
    }

    level.stopZombieLand = true;

    // Reset MegaZombie
    if (level.zombieBoss == true)
    {
        level thread HandleZombieBossDeath();
        wait 5;
    }

    // Stopping while loops and message
    level thread AllPlayerMessageLeftUnder("^1ZombieLand ^5mod ^7was running but is stopped by the Host!");
    self thread PlayerMessageLeftUnder("Stopping the ^1ZombieLand ^5mod!");
    wait 1;

    // Stopping the messages and functions
    level thread RemoveAllMoneyHud();
    level thread RemoveAllHealthHud();

    // Notify all functions to stop
    level notify("stop_zombieland");

    // Delete on-screen messages
    for ( i = 0; i < level.players.size; i++ )
    {
        level.players[i] thread SetHintString();
    }

    wait 1;
    // Delete the mini-map icons
    for ( i = 0; i < level.objectId; i++ )
    {
        objective_delete(i);
    }

    wait 1;
    // Delete all spawned models
    for ( i = 0; i < level.spawnedModels.size; i++ )
    {
        model = level.spawnedModels[i];
        model Delete();
        wait 0.01;
    }

    wait 1;
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
    SetDvar("bg_fallDamageMinHeight", level.bg_fallDamageMinHeight);
	SetDvar("bg_fallDamageMaxHeight", level.bg_fallDamageMaxHeight);
    SetDvar("scr_disable_weapondrop", level.scr_disable_weapondrop);

    self thread PlayerMessageLeftUnder("Stopped all ^1ZombieLand ^5mod ^7related stuff!");
}