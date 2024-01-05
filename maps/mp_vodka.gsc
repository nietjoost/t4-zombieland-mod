#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_vodka
Load()
{
    // Spawn flags
    SpawnFlag((5151, -990, 4), (5148, -1437, 4));
    SpawnFlag((105, -4054, -226), (5559, 268, 189));

    // Spawn Ziplines
    SpawnZipline((4714, 1622, 96), (3513, 2878, 152));
    SpawnZipline((3443, 412, 536), (4422, 253, 286));
    SpawnZipline((5209, -145, 295), (7269, -1562, 5));
    
    // Spawn Boost
    SpawnBoost((3361, 1099, 168), 400);

    // Spawn door
    wait 1;
    SpawnDoor((6125, 875, 220), (6123, 1048, 220), (0, 0, 150));
    SpawnDoor((6154, -551, 244), (6388, -556, 244), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (5236, 1892, 108), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (5986, 10, -3), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (4587, 612, 179), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (4438, -1979, 5), level.wallWeaponCost);
    SpawnMysteryBox((381, -4040, -226), (0, 90, 0));
}