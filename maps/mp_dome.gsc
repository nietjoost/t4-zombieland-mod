#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_dome
Load()
{
    // Spawn flags
    SpawnFlag((-907, 717, 88), (-1147, 864, 226));
    SpawnFlag((985, 723, 88), (1065, 849, 226));
    SpawnFlag((-401, 3219, 321), (34, 1743, 772));
    SpawnFlag((-981, 2059, 780), (14, 1660, 226));
    SpawnFlag((44, 3768, -743), (42, 970, 226));

    // Spawn Ziplines
    SpawnZipline((46, 433, 138), (44, 9, 138));
    SpawnZipline((50, 2246, 226), (44, 3130, 219));

    // Spawn Boost
    SpawnBoost((312, 1547, 226), 150);

    // Spawn door
    wait 1;
    SpawnDoor((223, 3669, 222), (-120, 3677, 222), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-158, 765, 136), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-1127, 1556, 226), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (382, 1099, 226), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (1004, 3084, 226), level.wallWeaponCost);
    SpawnMysteryBox((232, 4065, 94), (0, 0, 0));
}