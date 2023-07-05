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
    level.perksMoney = 100;
    level.perks = [];
    level.perks[1] = "specialty_fastreload";
    level.perks[2] = "specialty_longersprint";
    level.perks[3] = "specialty_bulletdamage";
    level.perks[4] = "specialty_flak_jacket";
    level.perks[5] = "specialty_gas_mask";
    level.perks[6] = "specialty_shades";
    level.perks[7] = "specialty_rof";
    level.perks[8] = "specialty_recon";
    level.perks[9] = "specialty_bulletpenetration";
    level.perks[10] = "specialty_explosivedamage";
    level.perks[11] = "specialty_bulletaccuracy";
    level.perks[12] = "specialty_pin_back";
    level.perks[13] = "specialty_pistoldeath";
    level.perks[14] = "specialty_grenadepulldeath";
    level.perks[15] = "specialty_fireproof";
    level.perks[16] = "specialty_quieter";
    level.perks[17] = "specialty_holdbreath";
    level.perks[18] = "specialty_water_cooled";
    level.perks[19] = "specialty_greased_barrings";
    level.perks[20] = "specialty_ordinance";
    level.perks[21] = "specialty_leadfoot";
    level.perks[22] = "specialty_boost";
    level.perks[23] = "specialty_armorvest";
}