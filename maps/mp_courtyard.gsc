#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_courtyard
Load()
{
    // Spawn flags
    SpawnFlag((3314, -926, 88), (2550, -634, 48));
    SpawnFlag((43, -794, 24), (4695, -308, 202));

    // Spawn Ziplines
    SpawnZipline((6103, -405, 144), (3481, -414, 88));

    // Spawn Boost
    SpawnBoost((4607, -419, 46), 100);

    // Spawn door
    wait 1;
    SpawnDoor((6009, -199, -32), (5900, -201, -32), (120, 0, 0));
    SpawnDoor((5893, -598, -38), (6016, -602, -38), (120, 0, 0));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (4348, -420, 137), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (5053, -413, 143), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (4446, -1877, 72), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (4622, 1080, 96), level.wallWeaponCost);
    SpawnMysteryBox((520, -606, 24), (0, 0, 0));
}