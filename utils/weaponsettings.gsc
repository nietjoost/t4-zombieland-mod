// WEAPON Settings
SetupWeaponSettings()
{
    // Initialize
    level.weapons = [];
    level.weapons["init"] = [];
    level.upgradeWeaponsMoney = 100;

    // Submachines settings
    level.weapons["thompson_mp"]["name"] = "thompson_mp";
    level.weapons["thompson_mp"]["money"] = 100;
    level.weapons["thompson_mp"]["upgradeName"] = "thompson_bigammo_mp";

    level.weapons["mp40_mp"]["name"] = "mp40_mp";
    level.weapons["mp40_mp"]["money"] = 100;
    level.weapons["mp40_mp"]["upgradeName"] = "mp40_bigammo_mp";

    level.weapons["type100smg_mp"]["name"] = "type100smg_mp";
    level.weapons["type100smg_mp"]["money"] = 100;
    level.weapons["type100smg_mp"]["upgradeName"] = "type100smg_bigammo_mp";

    // Submachines settings
    level.weapons["m1garand_mp"] = [];
    level.weapons["m1garand_mp"]["name"] = "m1garand_mp";
    level.weapons["m1garand_mp"]["money"] = 100;
    level.weapons["m1garand_mp"]["upgradeName"] = "m1garand_bayonet_mp";
}

// PERK Settings
SetupPerkSettings()
{
    // Initialize
    level.perks = [];
    level.perks["init"] = [];

    // Submachines settings
    level.perks["specialty_longersprint"]["name"] = "specialty_longersprint";
    level.perks["specialty_longersprint"]["money"] = 100;
}