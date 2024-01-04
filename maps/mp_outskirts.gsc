#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_outskirts
Load()
{
    // Spawn flags
    SpawnFlag((1815, 1528, -1047), (-33, 99, -1055));

    // Spawn Ziplines
    SpawnZipline((-171, 2546, -1258), (-157, 2072, -1236));
    SpawnZipline((385, 1564, -1073), (871, 1477, -1184));
    SpawnZipline((3106, 931, -1337), (774, 35, -1607));
    SpawnZipline((17, 444, -1587), (-2468, -846, -1897));
    SpawnZipline((2341, -2081, -1675), (-3, -159, -1559));

    // Spawn Boost
    SpawnBoost((-4, 2811, -1338), 200);
    SpawnBoost((1878, 1695, -1273), 300);
    SpawnBoost((-1226, -1937, -1684), 500);

    // Spawn door
    wait 1;
    SpawnDoor((270, 3242, -1306), (274, 3123, -1306), (0, 0, 150));
    SpawnDoor((895, 3233, -1308), (901, 3044, -1308), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-2275, -2135, -1881), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-795, 1633, -1621), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (2334, -466, -1623), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-614, -470, -1590), level.wallWeaponCost);
    SpawnMysteryBox((1587, 1157, -1067), (0, 90, 0));
}