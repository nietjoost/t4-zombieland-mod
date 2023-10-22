#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_stalingrad
Load()
{
    // Spawn flags
    SpawnFlag((682, 1195, 2), (583, 1754, 64));
    SpawnFlag((426, 1521, 245), (-1613, 969, 0));
    SpawnFlag((-478, -1186, 0), (-946, -1259, 67));

    // Spawn Ziplines
    SpawnZipline((1954, 319, 202), (2537, 1743, 1432));
    SpawnZipline((1034, -5238, 1224), (2859, 1559, 918));
    SpawnZipline((555, -4400, 1224), (915, -1322, -35));
    SpawnZipline((-2142, -1402, 529), (-1658, -761, 152));

    // Spawn Boost
    SpawnBoost((3195, 2424, 954), 800);

    // Spawn door
    wait 1;
    SpawnDoor((-13, 2076, 234), (-164, 1896, 234), (0, 0, 120));
    SpawnDoor((-694, -708, 154), (-690, -821, 154), (0, 0, 120));
    SpawnDoor((-1612, -447, 152), (-1731, -447, 152), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (2055, 601, 0), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (98, 121, 0), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (-1720, 93, -1), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-305, -1033, 0), level.wallWeaponCost);
    SpawnMysteryBox((2999, 2555, 1432), (0, 90, 0));
}