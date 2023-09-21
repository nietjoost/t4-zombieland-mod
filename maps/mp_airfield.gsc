#include scripts\mp\utils\doorlogic;
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
    CreateWallWeapon("thompson_mp", (1322, 5320, 145), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (2989, 2277, -60), level.wallWeaponCost);

    // Spawn doors
    SpawnDoor((2407, 1417, 104), (2303, 1498, 104), (0, 0, 120), (2488, 1331, 104));
    SpawnDoor((2950, 1649, -43), (2834, 1741, -43), (0, 0, 200), (2799, 1742, -43));

    // Spawn map edits
    //CreateFloor(level.collisionModel, (3139, 282, -52), (3366, 494, -52), self.angles, 35, 35, 60);
    //CreateElevator(level.collisionModel, (3346, 2606, -61), (3346, 2606, 505), (0,0,0), 10, 2);
    CreateRamp(level.collisionModel, (1680, 3110, 116), (1506, 3005, 116), 35);
    CreateRamp(level.collisionModel, (712, 1792, 85), (973, 1822, 110), 35);
}