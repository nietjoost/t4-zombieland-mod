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

    // Array with all weapons
    level.mbweapons = [];
    level.mbweapons[0] = "defaultweapon_mp";
    level.mbweapons[1] = "dp28_mp";
    level.mbweapons[2] = "fg42_mp";
    level.mbweapons[3] = "svt40_mp";
    level.mbweapons[4] = "m2_flamethrower_mp";
    level.mbweapons[5] = "bazooka_mp";
    level.mbweapons[6] = "molotov_mp";
    level.mbweapons[7] = "mine_shoebox_mp";
    level.mbweapons[8] = "frag_grenade_mp";
    level.mbweapons[9] = "bar_mp";
    level.mbweapons[10] = "kar98k_mp";
    level.mbweapons[11] = "357magnum_mp";
    level.mbweapons[12] = "nambu_mp";
    level.mbweapons[13] = "walther_mp";
    level.mbweapons[15] = "mp40_mp";
    level.mbweapons[16] = "ppsh_mp";
    level.mbweapons[17] = "shotgun_mp";
    level.mbweapons[18] = "type99lmg_mp";
    level.mbweapons[19] = "stg44_mp";
    level.mbweapons[20] = "type100smg_mp";
    level.mbweapons[21] = "doublebarreledshotgun_mp";
    level.mbweapons[22] = "springfield_mp";
    level.mbweapons[23] = "springfield_bayonet_mp";
    level.mbweapons[24] = "springfield_gl_mp";
    level.mbweapons[25] = "gl_springfield_mp";
    level.mbweapons[26] = "thompson_mp";
    level.mbweapons[27] = "kar98k_scoped_mp";
    level.mbweapons[28] = "kar98k_bayonet_mp";
    level.mbweapons[29] = "kar98k_gl_mp";
    level.mbweapons[30] = "gl_kar98k_mp";
    level.mbweapons[31] = "type99rifle_scoped_mp";
    level.mbweapons[32] = "type99rifle_gl_mp";
    level.mbweapons[33] = "gl_type99rifle_mp";
    level.mbweapons[34] = "mosinrifle_gl_mp";
    level.mbweapons[35] = "gl_mosinrifle_mp";
    level.mbweapons[36] = "m1carbine_aperture_mp";
    level.mbweapons[37] = "m1carbine_flash_mp";
    level.mbweapons[38] = "gewehr43_mp";
    level.mbweapons[39] = "gewehr43_silenced_mp";
    level.mbweapons[40] = "gewehr43_aperture_mp";
    level.mbweapons[41] = "stg44_aperture_mp";
    level.mbweapons[42] = "svt40_flash_mp";
    level.mbweapons[43] = "svt40_aperture_mp";
    level.mbweapons[44] = "ppsh_aperture_mp";
    level.mbweapons[45] = "mp40_aperture_mp";
    level.mbweapons[46] = "mp40_silenced_mp";
    level.mbweapons[47] = "thompson_aperture_mp";
    level.mbweapons[48] = "thompson_silenced_mp";
    level.mbweapons[49] = "shotgun_grip_mp";
    level.mbweapons[50] = "doublebarreledshotgun_grip_mp";
    level.mbweapons[51] = "doublebarreledshotgun_sawoff_mp";
    level.mbweapons[52] = "m1garand_flash_mp";
    level.mbweapons[53] = "m1garand_gl_mp";
    level.mbweapons[54] = "gl_m1garand_mp";
    level.mbweapons[55] = "stg44_selectfire_mp";
    level.mbweapons[56] = "stg44_singleshot_mp";
    level.mbweapons[57] = "gewehr43_gl_mp";
    level.mbweapons[58] = "gl_gewehr43_mp";
    level.mbweapons[59] = "tokarev_mp";
    level.mbweapons[60] = "sticky_grenade_mp";
    level.mbweapons[61] = "springfield_scoped_mp";
    level.mbweapons[62] = "m1carbine_mp";
    level.mbweapons[63] = "m1garand_scoped_mp";
    level.mbweapons[64] = "svt40_telescopic_mp";
    level.mbweapons[65] = "svt40_selectfire_mp";
    level.mbweapons[66] = "svt40_fullauto_mp";
    level.mbweapons[67] = "mg42_mp";
    level.mbweapons[68] = "gewehr43_telescopic_mp";
    level.mbweapons[69] = "m1carbine_bigammo_mp";
    level.mbweapons[70] = "mosinrifle_scoped_mp";
    level.mbweapons[71] = "m1garand_mp";
    level.mbweapons[72] = "mosinrifle_mp";
    level.mbweapons[73] = "colt_mp";
    level.mbweapons[74] = "fg42_telescopic_mp";
    level.mbweapons[75] = "type99lmg_bayonet_mp";
    level.mbweapons[76] = "m1carbine_bayonet_mp";
    level.mbweapons[77] = "ptrs41_mp";
    level.mbweapons[78] = "thompson_bigammo_mp";
    level.mbweapons[79] = "mp40_bigammo_mp";
    level.mbweapons[80] = "ppsh_bigammo_mp";
    level.mbweapons[81] = "type99rifle_bayonet_mp";
    level.mbweapons[82] = "mosinrifle_bayonet_mp";
    level.mbweapons[83] = "m1garand_bayonet_mp";
    level.mbweapons[84] = "stg44_telescopic_mp";
    level.mbweapons[85] = "type100smg_silenced_mp";
    level.mbweapons[86] = "type100smg_aperture_mp";
    level.mbweapons[87] = "type100smg_bigammo_mp";
    level.mbweapons[88] = "stg44_flash_mp";

    // radar_mp
    // dogs_mp
    // artillery_mp
    // kamikaze_mp
    // squadcommand_mp
    // kamikaze_gunner_mp
    // mine_bouncing_betty_mp

    for (i = 0; i < level.mbweapons.size; i++)
    {
        PrecacheItem(level.mbweapons[i]);
	    PrecacheModel(level.mbweapons[i]);
    }
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