#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_downfall
Load()
{
    // Spawn flags
    SpawnFlag((-2351, 10121, -57), (-2159, 11132, -23));

    // Spawn Ziplines
    SpawnZipline((4368, 8815, -27), (1123, 8689, 248));
    SpawnZipline((1112, 8443, 248), (-2476, 8526, 56));
    SpawnZipline((720, 11167, 552), (1245, 9778, 118));
    SpawnZipline((4582, 11334, -111), (4871, 9589, -77));
    SpawnZipline((-530, 6373, 167), (1270, 8253, 190));

    // Spawn Boost
    SpawnBoost((5163, 8719, 92), 150);
    SpawnBoost((709, 11429, 73), 600);

    // Spawn door
    wait 1;
    SpawnDoor((-675, 6213, 162), (-830, 6202, 160), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (3821, 8541, -92), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (1939, 8596, 20), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (317, 8176, 33), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-1503, 8899, -51), level.wallWeaponCost);
    SpawnMysteryBox((-1478, 12203, -49), (0, 0, 0));
}