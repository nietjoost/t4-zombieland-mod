#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_nachtfeuer
Load()
{
    // Spawn flags
    SpawnFlag((1117, -327, 1168), (1245, 1394, 1375));
    SpawnFlag((88, -1563, 1260), (-180, -1746, 1173));
    SpawnFlag((-1826, -1318,1168), (271, -611, 1303));

    // Spawn Ziplines
    SpawnZipline((1558, 1651, 1352), (2961, 1953, 1220));
    SpawnZipline((786, 2496, 1192), (1382, 2772, 1201));

    // Spawn Boost
    SpawnBoost((978, 1774, 1163), 200);

    // Spawn door
    wait 1;
    SpawnDoor((566, 144, 1307), (657, 150, 1307), (0, 0, 200));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-233, 1995, 1159), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (1733, 1213, 1156), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (1320, -1060, 1156), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (871, 748, 1099), level.wallWeaponCost);
    SpawnMysteryBox((857, -485, 1295), (0, 90, 0));
}