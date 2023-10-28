#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_hangar
Load()
{
    // Spawn flags
    SpawnFlag((-693, 372, 622), (-687, 613, 622));
    SpawnFlag((680, -3239, 626), (682, -3411, 710));
    SpawnFlag((-1131, -3229, 714), (-908, -3007, 672));

    // Spawn Ziplines
    SpawnZipline((-2044, -852, 554), (224, -973, 782));
    SpawnZipline((-1382, -1941, 969), (-559, -2367, 752));
    SpawnZipline((1558, 1067, 640), (1610, -454, 782));

    // Spawn Boost
    SpawnBoost((-848, -671, 628), 300);
    SpawnBoost((-2014, -1071, 554), 200);

    // Spawn door
    wait 1;
    SpawnDoor((290, -275, 782), (113, -276, 782), (0, 0, 120));
    SpawnDoor((432, 659, 722), (317, 654, 720), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (678, -2388, 626), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-1051, -2095, 681), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (186, 146, 640), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (1623, -939, 782), level.wallWeaponCost);
    SpawnMysteryBox((-4204, 162, 554), (0, 0, 0));
}