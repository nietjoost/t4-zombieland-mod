#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_kneedeep
Load()
{
    // Spawn flags
    SpawnFlag((-1833, -2321, 137), (-2068, -2495, 262));
    SpawnFlag((2606, 2231, 77), (2969, 2807, 74));
    SpawnFlag((2226, -1145, 3), (1585, -708, 130));
    SpawnFlag((804, 1430, 69), (295, -847, 278));

    // Spawn Ziplines
    SpawnZipline((-3617, 1055, 162), (-1821, 277, 319));
    SpawnZipline((158, -1227, 278), (-88, -2675, 288));
    SpawnZipline((-321, -2722, 297), (-779, -1864, 390));
    SpawnZipline((-1328, -1988, 390), (-960, -2078, 172));

    // Spawn Boost
    SpawnBoost((-1263, -975, 38), 200);

    // Spawn door
    wait 1;
    SpawnDoor((52, 1335, 215), (167, 1268, 215), (0, 0, 220));
    SpawnDoor((1139, -84, 116), (1246, -315, 116), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-526, -906, 222), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (892, -1218, 134), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (1532, 753, 213), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-777, 729, 88), level.wallWeaponCost);
    SpawnMysteryBox((-5181, 1195, 583), (0, 90, 0));
}