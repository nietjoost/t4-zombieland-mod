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
    level.mbweapons[1] = "satchel_charge_mp";
    level.mbweapons[2] = "m2_flamethrower_mp";
    level.mbweapons[3] = "mine_bouncing_betty_mp";
    level.mbweapons[4] = "30cal_mp";
    level.mbweapons[5] = "30cal_bipod_stand_mp";
    level.mbweapons[6] = "30cal_bipod_crouch_mp";
    level.mbweapons[7] = "30cal_bipod_prone_mp";
    level.mbweapons[8] = "dp28_mp";
    level.mbweapons[9] = "dp28_bipod_stand_mp";
    level.mbweapons[10] = "dp28_bipod_crouch_mp";
    level.mbweapons[11] = "dp28_bipod_prone_mp";
    level.mbweapons[12] = "fg42_mp";
    level.mbweapons[13] = "fg42_bipod_stand_mp";
    level.mbweapons[14] = "fg42_bipod_crouch_mp";
    level.mbweapons[15] = "fg42_bipod_prone_mp";
    level.mbweapons[16] = "svt40_mp";
    level.mbweapons[17] = "m2_flamethrower_mp";
    level.mbweapons[18] = "bazooka_mp";
    level.mbweapons[19] = "molotov_mp";
    level.mbweapons[20] = "mine_shoebox_mp";
    level.mbweapons[21] = "frag_grenade_mp";
    level.mbweapons[22] = "bar_mp";
    level.mbweapons[23] = "bar_bipod_stand_mp";
    level.mbweapons[24] = "bar_bipod_crouch_mp";
    level.mbweapons[25] = "bar_bipod_prone_mp";
    level.mbweapons[26] = "kar98k_mp";
    level.mbweapons[27] = "357magnum_mp";
    level.mbweapons[28] = "nambu_mp";
    level.mbweapons[29] = "walther_mp";
    level.mbweapons[30] = "mp40_mp";
    level.mbweapons[31] = "thompson_mp";
    level.mbweapons[32] = "ppsh_mp";
    level.mbweapons[33] = "shotgun_mp";
    level.mbweapons[34] = "type99lmg_mp";
    level.mbweapons[35] = "type99_lmg_bipod_stand_mp";
    level.mbweapons[36] = "type99_lmg_bipod_crouch_mp";
    level.mbweapons[37] = "type99_lmg_bipod_prone_mp";
    level.mbweapons[38] = "stg44_mp";
    level.mbweapons[39] = "type100smg_mp";
    level.mbweapons[40] = "type99rifle_mp";
    level.mbweapons[41] = "doublebarreledshotgun_mp";
    level.mbweapons[42] = "springfield_mp";
    level.mbweapons[43] = "springfield_bayonet_mp";
    level.mbweapons[44] = "springfield_gl_mp";
    level.mbweapons[45] = "gl_springfield_mp";
    level.mbweapons[46] = "kar98k_scoped_mp";
    level.mbweapons[47] = "kar98k_bayonet_mp";
    level.mbweapons[48] = "kar98k_gl_mp";
    level.mbweapons[49] = "gl_kar98k_mp";
    level.mbweapons[50] = "type99rifle_scoped_mp";
    level.mbweapons[51] = "type99rifle_gl_mp";
    level.mbweapons[52] = "gl_type99rifle_mp";
    level.mbweapons[53] = "mosinrifle_gl_mp";
    level.mbweapons[54] = "gl_mosinrifle_mp";
    level.mbweapons[55] = "m1carbine_aperture_mp";
    level.mbweapons[56] = "m1carbine_flash_mp";
    level.mbweapons[57] = "gewehr43_mp";
    level.mbweapons[58] = "gewehr43_silenced_mp";
    level.mbweapons[59] = "gewehr43_aperture_mp";
    level.mbweapons[60] = "stg44_aperture_mp";
    level.mbweapons[61] = "svt40_flash_mp";
    level.mbweapons[62] = "svt40_aperture_mp";
    level.mbweapons[63] = "ppsh_aperture_mp";
    level.mbweapons[64] = "mp40_aperture_mp";
    level.mbweapons[65] = "mp40_silenced_mp";
    level.mbweapons[66] = "thompson_aperture_mp";
    level.mbweapons[67] = "thompson_silenced_mp";
    level.mbweapons[68] = "shotgun_grip_mp";
    level.mbweapons[69] = "doublebarreledshotgun_grip_mp";
    level.mbweapons[70] = "doublebarreledshotgun_sawoff_mp";
    level.mbweapons[71] = "fg42_bipod_mp";
    level.mbweapons[72] = "dp28_bipod_mp";
    level.mbweapons[73] = "bar_bipod_mp";
    level.mbweapons[74] = "type99lmg_bipod_mp";
    level.mbweapons[75] = "m1garand_flash_mp";
    level.mbweapons[76] = "m1garand_gl_mp";
    level.mbweapons[77] = "gl_m1garand_mp";
    level.mbweapons[78] = "stg44_selectfire_mp";
    level.mbweapons[79] = "stg44_singleshot_mp";
    level.mbweapons[80] = "gewehr43_gl_mp";
    level.mbweapons[81] = "gl_gewehr43_mp";
    level.mbweapons[82] = "tokarev_mp";
    level.mbweapons[83] = "sticky_grenade_mp";
    level.mbweapons[84] = "springfield_scoped_mp";
    level.mbweapons[85] = "m1carbine_mp";
    level.mbweapons[86] = "m1garand_scoped_mp";
    level.mbweapons[87] = "svt40_telescopic_mp";
    level.mbweapons[88] = "svt40_selectfire_mp";
    level.mbweapons[89] = "svt40_fullauto_mp";
    level.mbweapons[90] = "30cal_bipod_mp";
    level.mbweapons[91] = "mg42_mp";
    level.mbweapons[92] = "mg42_bipod_stand_mp";
    level.mbweapons[93] = "mg42_bipod_crouch_mp";
    level.mbweapons[94] = "mg42_bipod_prone_mp";
    level.mbweapons[95] = "mg42_bipod_mp";
    level.mbweapons[96] = "gewehr43_telescopic_mp";
    level.mbweapons[97] = "m1carbine_bigammo_mp";
    level.mbweapons[98] = "mosinrifle_scoped_mp";
    level.mbweapons[99] = "m1garand_mp";
    level.mbweapons[100] = "mosinrifle_mp";
    level.mbweapons[101] = "colt_mp";
    level.mbweapons[102] = "fg42_telescopic_mp";
    level.mbweapons[103] = "type99lmg_bayonet_mp";
    level.mbweapons[104] = "m1carbine_bayonet_mp";
    level.mbweapons[105] = "ptrs41_mp";
    level.mbweapons[106] = "thompson_bigammo_mp";
    level.mbweapons[107] = "mp40_bigammo_mp";
    level.mbweapons[108] = "ppsh_bigammo_mp";
    level.mbweapons[109] = "type99rifle_bayonet_mp";
    level.mbweapons[110] = "mosinrifle_bayonet_mp";
    level.mbweapons[111] = "m1garand_bayonet_mp";
    level.mbweapons[112] = "stg44_telescopic_mp";
    level.mbweapons[113] = "syrette_mp";
    level.mbweapons[114] = "napalmblob_mp";
    level.mbweapons[115] = "m8_white_smoke_mp";
    level.mbweapons[116] = "tabun_gas_mp";
    level.mbweapons[117] = "signal_flare_mp";
    level.mbweapons[118] = "type100smg_silenced_mp";
    level.mbweapons[119] = "type100smg_aperture_mp";
    level.mbweapons[120] = "type100smg_bigammo_mp";
    level.mbweapons[121] = "stg44_flash_mp";
    level.mbweapons[123] = "shotgun_bayonet_mp";
    level.mbweapons[124] = "frag_grenade_short_mp";
    //level.mbweapons[] = "briefcase_bomb_mp";
    //level.mbweapons[] = "briefcase_bomb_defuse_mp";
    //level.mbweapons[] = "radar_mp";
    //level.mbweapons[] = "dogs_mp";
    //level.mbweapons[] = "artillery_mp";
    //level.mbweapons[] = "kamikaze_mp";
    //level.mbweapons[] = "squadcommand_mp";
    //level.mbweapons[] = "kamikaze_gunner_mp";

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