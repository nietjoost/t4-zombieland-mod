#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_castle
Load()
{
    // Spawn flags
    SpawnFlag((-26, -867, 847), (-202, -1107, 841));
    SpawnFlag((112, -5451, 786), (-92, -459, 831));
    SpawnFlag((-316, 1504, 379), (-657, 1306, 364));
    SpawnFlag((243, 3955, 859), (-26, 4096, 898));
    SpawnFlag((-479, 4096, 898), (621, 3702, 879));
    SpawnFlag((2149, -670, 855), (2387, -1159, 856));

    // Spawn Ziplines
    SpawnZipline((-4369, -78, 389), (221, 1313, 843));
    SpawnZipline((183, 669, 847), (-1021, 830, 717));
    SpawnZipline((-1310, 1664, 382), (187, 1962, 849));
    SpawnZipline((1839, 2931, 833), (3171, 1413, 758));
    SpawnZipline((417, -2268, 1488), (-172, -2690, 1489));

    // Spawn door
    wait 1;
    SpawnDoor((559, -3129, 842), (819, -3073, 842), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (371, 1036, 848), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (1801, 2608, 818), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (3049, 990, 768), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (708, 1343, 357), level.wallWeaponCost);
    SpawnMysteryBox((704, -3458, 841), (0, 90, 0));
}