// WEAPON Settings
SetupWeaponSettings()
{
    // Initialize
    level.weapons = [];
    level.upgradeWeaponsMoney = 100;

    // Submachines settings
    level.weapons["thompson_mp"] = [];
    level.weapons["thompson_mp"]["name"] = "thompson_mp";
    level.weapons["thompson_mp"]["money"] = 100;
    level.weapons["thompson_mp"]["upgradeName"] = "thompson_bigammo_mp";

    level.weapons["type100smg_mp"]["name"] = "type100smg_mp";
    level.weapons["type100smg_mp"]["money"] = 100;
    level.weapons["type100smg_mp"]["upgradeName"] = "type100smg_bigammo_mp";
}