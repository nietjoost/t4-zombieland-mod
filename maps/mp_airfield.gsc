#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_airfield
Load()
{
    // Spawn flags
    SpawnFlag((3533, 3129, -28), (3296, 3026, 326));
    SpawnFlag((1777, 3161, -1), (1823, 3287, 142));
    SpawnFlag((652, 1779, 16), (652, 1779, 110));

    // Spawn Ziplines
    SpawnZipline((747, 3009, 130), (544, 2735, 1));
    SpawnZipline((2150, 5530, 149), (2564, 1828, 102));
    SpawnZipline((969, 2644, 149), (3346, 2606, 505));

    // Spawn Boost
    SpawnBoost((3178, 4990, 8), 400);

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (1322, 5320, 145), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (2989, 2277, -60), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (2569, 3665, -163), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (4323, 4429, 0), level.wallWeaponCost);
    SpawnMysteryBox((868, 3550, 129), (0,0,0));

    // Spawn doors
    wait 1;
    SpawnDoor((2407, 1417, 104), (2303, 1498, 104), (0, 0, 120));
    SpawnDoor((2950, 1649, -43), (2834, 1741, -43), (0, 0, 200));

    // Spawn map edits
    CreateRamp(level.collisionModel, (1680, 3110, 116), (1506, 3005, 116), 35);
    CreateRamp(level.collisionModel, (712, 1792, 85), (973, 1822, 110), 35);
}