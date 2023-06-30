#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;

// MP_airfield
Load()
{
    // Spawn flags
    SpawnFlag((3533, 3129, -28), (3296, 3026, 326));
    SpawnFlag((1777, 3161, -1), (1823, 3287, 142));

    // Spawn Ziplines
    SpawnZipline((747, 3009, 130), (544, 2735, 1));
    SpawnZipline((2150, 5530, 149), (2564, 1828, 102));

    // Spawn map edits
    CreateFloor(level.collisionModel, (3139, 282, -52), (3366, 494, -52), self.angles, 35, 35, 60);
}