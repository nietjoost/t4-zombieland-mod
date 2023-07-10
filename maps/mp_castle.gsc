#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_castle
Load()
{
    // Spawn flags
    SpawnFlag((1096, -427, -442), (1344, -262, -350));
    SpawnFlag((3146, -1784, -255), (2892, -933, -574), false);
    SpawnFlag((5002, -1013, -196), (5216, -1011, -141));
    SpawnFlag((4966, -1716, -137), (4751, -2139, -239));

    // Spawn Ziplines
    SpawnZipline((2721, 262, -317), (2659, -1686, -320));
    SpawnZipline((1847, -1809, -53), (3057, -1765, 150));
    SpawnZipline((-1165, -2502, -97), (1103, -2789, -133));
    SpawnZipline((2428, -3869, 88), (3860, -3250, 635));
    SpawnZipline((4086, -3248, 641), (6458, -2219, 158));
    SpawnZipline((6474, -1429, 158), (5963, -899, -126));

    // Spawn map edits
    CreateRamp(level.collisionModel, (-153, -3473, -50), (-152, -2642, -227), 35);
    CreateRamp(level.collisionModel, (446, -3420, -30), (446, -3420, -20), 35);
}