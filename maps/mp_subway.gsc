#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_subway
Load()
{
    // Spawn flags
    SpawnFlag((-1853, 1964, 974), (-1853, 1964, 1096));
    SpawnFlag((-3449, 1483, 764), (-3559, 1453, 764));
    SpawnFlag((-648, 3377, 814), (-736, 3341, 760));

    // Spawn Ziplines
    SpawnZipline((-3752, 1121, 868), (-302, 3119, 942));
    SpawnZipline((-1581, -1384, 896), (-1586, -482, 1214));
    SpawnZipline((-3328, 4913, 896), (-3063, 3964, 1208));
    
    // Spawn Boost
    SpawnBoost((-2015, 2376, 1096), 100);
    SpawnBoost((-2338, 3097, 1096), 100);
    SpawnBoost((-2777, 3903, 1096), 100);

    // Spawn door
    wait 1;
    SpawnDoor((-3193, 2059, 765), (-3448, 1922, 765), (0, 0, 150));
    SpawnDoor((-3216, 1079, 765), (-2927, 1085, 765), (0, 0, 150));
    SpawnDoor((-2839, 1845, 764), (-2748, 1523, 764), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-1610, 881, 720), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-2250, 2929, 720), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (-216, 2517, 782), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-3052, 1716, 764), level.wallWeaponCost);
    SpawnMysteryBox((-1143, 1085, 1208), (0, 90, 0));
}