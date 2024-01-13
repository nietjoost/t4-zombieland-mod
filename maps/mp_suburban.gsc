#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_suburban
Load()
{
    // Spawn flags
    SpawnFlag((263, -5825, -659), (-100, -5787, -668));
    SpawnFlag((-119, -4299, -540), (138, -4020, -528));

    // Spawn Ziplines
    SpawnZipline((-3616, -6101, -653), (-2738, -4417, -532));
    SpawnZipline((-1166, -1849, -267), (154, -2989, -143));
    SpawnZipline((1160, -371, -384), (1234, 63, -327));
    SpawnZipline((102, -53, -392), (-499, -120, -647));
    
    // Spawn Boost
    SpawnBoost((-1383, -2095, -373), 200);
    SpawnBoost((2091, -3000, -486), 500);

    // Spawn door
    wait 1;
    SpawnDoor((-2190, -5968, -647), (-2182, -6237, -647), (0, 0, 150));
    SpawnDoor((-2248, -4303, -529), (-2245, -4539, -529), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (817, -3529, -553), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (628, -1240, -405), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (2305, -3158, -508), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-405, -2531, -435), level.wallWeaponCost);
    SpawnMysteryBox((1840, -2889, -2), (0, 90, 0));
}