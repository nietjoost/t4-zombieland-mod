#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_drum
Load()
{
    // Spawn flags
    SpawnFlag((8538, -5652, 320), (7717, -5283, 194));
    SpawnFlag((7764, -3875, 194), (8587, -3819, 192));

    // Spawn Ziplines
    SpawnZipline((9544, -2799, 216), (9705, -3369, 192));
    SpawnZipline((10290, -3878, 192), (10661, -2934, 223));

    // Spawn Boost
    SpawnBoost((9315, -5173, 193), 300);

    // Spawn door
    wait 1;
    SpawnDoor((10765, -2956, 17), (10546, -2953, 17), (140, 0, 0));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("ppsh_bigammo_mp", (9252, -4088, 193), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (11110, -4513, 204), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (9972, -5550, 193), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (10611, -3608, 14), level.wallWeaponCost);
    SpawnMysteryBox((10063, -2555, 216), (0, 0, 0));
}