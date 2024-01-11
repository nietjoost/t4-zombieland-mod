#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_seelow
Load()
{
    // Spawn Ziplines
    SpawnZipline((2573, 7411, 642), (326, 5316, 418));
    SpawnZipline((101, 4760, 418), (-2385, 2578, 496));
    SpawnZipline((145, 2533, 18), (-1097, 2570, 17));
    SpawnZipline((-1266, 2569, 496), (599, 2447, 482));
    SpawnZipline((2960, 2042, 482), (1841, 2157, 482));
    SpawnZipline((1182, 2291, 482), (798, 613, 117));
    SpawnZipline((1332, 635, 117), (2344, 345, 120));
    SpawnZipline((2926, -65, 120), (2317, -2405, 154));
    SpawnZipline((3960, 5639, 405), (3203, 7310, 642));

    wait 1;
    SpawnZipline((1317, -1627, 84), (2205, -2943, 124));
    SpawnZipline((3056, -2450, 35), (3853, -1439, 180));
    SpawnZipline((4350, -1017, 180), (4459, 775, 119));
    SpawnZipline((3957, 1164, 120), (3752, 1984, 482));
    SpawnZipline((3353, 2167, 482), (3324, 3651, 384));
    SpawnZipline((2831, 4053, 384), (3904, 5207, 405));


    // Spawn Boost
    wait 1;
    SpawnBoost((2068, -2597, -270), 400);
    SpawnBoost((2706, 93, -311), 400);
    SpawnBoost((4101, -1082, -251), 500);
    SpawnBoost((4232, 940, -298), 400);
    SpawnBoost((1977, 2006, 9), 600);
    SpawnBoost((3007, 3973, -92), 500);
    SpawnBoost((4084, 5835, -62), 600);
    SpawnBoost((2692, 7293, 122), 500);
    SpawnBoost((-175, 5069, -48), 600);

    // Spawn door
    wait 1;
    SpawnDoor((-1789, 2742, 15), (-1785, 2401, 15), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (2908, 3747, 384), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (2999, 7591, 642), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (4341, -1316, 180), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (1305, -1301, 84), level.wallWeaponCost);
    SpawnMysteryBox((-2526, 2563, 15), (0, 45, 0));
}