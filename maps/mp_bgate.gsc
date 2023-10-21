#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_bgate
Load()
{
    // Spawn flags
    SpawnFlag((-1925, -2418, 33), (-1931, -2643, 71));
    SpawnFlag((-1470, 111, 0), (-1429, 662, 6));
    SpawnFlag((1277, 1085, 8), (1056, 1106, 7));

    // Spawn Ziplines
    SpawnZipline((-2802, -743, 282), (-907, -1484, 187));
    SpawnZipline((-1003, -481, 160), (920, -438, 163));
    SpawnZipline((789, 374, 166), (-944, 1073, 176));
    SpawnZipline((1137, -1824, 4), (1461, -927, 153));
    SpawnZipline((1607, -929, 153), (1580, -95, 153));
    SpawnZipline((1882, 222, 346), (1288, 351, 0));

    // Spawn Boost
    SpawnBoost((-841, -1182, 0), 200);
    SpawnBoost((1494, -8, -1), 200);

    // Spawn door
    wait 1;
    SpawnDoor((-1863, -2123, 45), (-1942, -2044, 45), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("ppsh_bigammo_mp", (-48, -334, 0), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-29, 1257, 72), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (1121, -910, -158), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-1073, -167, 1), level.wallWeaponCost);
    SpawnMysteryBox((-1694, -1132, 0), (0, 0, 0));
}