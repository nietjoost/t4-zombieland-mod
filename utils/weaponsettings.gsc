// WEAPON Settings
SetupWeaponSettings()
{
    // Initialize
    level.weapons = [];

    // Submachines settings
    level.weapons["thompson"] = [];
    level.weapons["thompson"]["name"] = "thompson_mp";
    level.weapons["thompson"]["money"] = 100;
    level.weapons["thompson"]["upgradeName"] = "thompson_bigammo_mp";
    level.weapons["thompson"]["upgradeMoney"] = level.weapons["thompson"].money * 2;

    level.weapons["type"]["name"] = "type100smg_mp";
    level.weapons["type"]["money"] = 100;
    level.weapons["type"]["upgradeName"] = "type100smg_bigammo_mp";
    level.weapons["type"]["upgradeMoney"] = level.weapons["type"]["money"] * 2;
}