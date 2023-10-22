#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_shrine
Load()
{
    // Spawn flags
    SpawnFlag((362, 976, -166), (802, 1365, -196));
    SpawnFlag((-3555, -1310, -76), (-3537, -1583, -76));
    SpawnFlag((-4196, -1153, -76), (-5037, 461, -267));
    SpawnFlag((-4736, 1086, -267), (-3310, 1188, -289));

    // Spawn Ziplines
    SpawnZipline((-467, 1284, -69), (-1125, 1753, -305));
    SpawnZipline((200, 1495, -210), (-48, 1521, -234));
    SpawnZipline((-1325, -1704, -7), (-1949, 780, -181));
    SpawnZipline((-4122, -219, -201), (-813, 662, -329));

    // Spawn Boost
    SpawnBoost((807, 443, -412), 400);

    // Spawn door
    wait 1;
    SpawnDoor((-3884, -1245, -77), (-3979, -1397, -74), (0, 0, 120));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-3602, 253, -380), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-885, -398, -369), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (-2113, 1182, -272), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-2005, -1513, -66), level.wallWeaponCost);
    SpawnMysteryBox((172, 1155, -196), (0, 50, 0));
}