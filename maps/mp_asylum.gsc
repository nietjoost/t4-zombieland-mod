#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_asylum
Load()
{
    // Spawn flags
    SpawnFlag((-1373, -1626, -53), (-1591, -1629, -43));
    SpawnFlag((-1625, -1040, 13), (-1458, -1034, 24));
    SpawnFlag((1815, 1876, 153), (1994, 1960, 162));
    SpawnFlag((466, 680, 358), (451, 15, 23));
    SpawnFlag((1618, 205, 32), (933, -517, 194));

    // Spawn Ziplines
    SpawnZipline((-1939, -1731, -37), (-1821, -1029, 16));
    SpawnZipline((-1581, 262, 42), (-1274, 271, 358));
    SpawnZipline((-432, 1215, 116), (-421, 720, 464));
    SpawnZipline((160, 9, 327), (-1316, -3, 672));

    // Spawn Boost
    SpawnBoost((320, 142, 26), 400);
    SpawnBoost((-1478, -11, 40), 650);

    // Spawn door
    SpawnDoor((869, -303, 215), (1025, -303, 215), (0, 0, 120));
    SpawnDoor((71, -446, 220), (69, -709, 220), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-418, -279, 28), level.wallWeaponCost);
    SpawnMysteryBox((934, 202, 194), (0,0,0));

    // Spawn map edits
    CreateRamp(level.collisionModel, (-1644, 363, 65), (-1455, 366, 65), 35);
}