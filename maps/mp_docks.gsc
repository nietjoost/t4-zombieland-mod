#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_docks
Load()
{
    // Spawn flags
    SpawnFlag((840, 264, -63), (837, -28, -62));
    SpawnFlag((-2023, 533, -31), (-1960, 826, -31));
    SpawnFlag((-2016, 1726, -31), (-2014, 1954, -31));
    SpawnFlag((1740, 1836, 64), (1735, 1658, -31));

    // Spawn Ziplines
    SpawnZipline((813, -1782, -63), (-3040, 1242, 443));
    SpawnZipline((-1913, 1241, -64), (-2418, 2246, -31));
    SpawnZipline((-1226, 2179, -31), (1508, 2149, 64));
    
    // Spawn Boost
    SpawnBoost((-3295, 1233, -36), 550);

    // Spawn door
    wait 1;
    SpawnDoor((-488, 3, -8), (-487, 190, -8), (0, 0, 150));
    SpawnDoor((-1900, 2158, -31), (-2097, 2155, -31), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (1478, 1243, -36), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-1445, 1249, -66), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (-802, 1970, 96), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-765, 302, -30), level.wallWeaponCost);
    SpawnMysteryBox((-4284, 1229, 290), (0, 0, 0));
}