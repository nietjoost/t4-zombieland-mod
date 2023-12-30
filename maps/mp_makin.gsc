#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_makin
Load()
{
    // Spawn flags
    SpawnFlag((-11077, -19865, -4), (-11366, -20056, -29));
    SpawnFlag((-12138, -16610, -32), (-12589, -16605, -16));
    SpawnFlag((-9046, -20906, -28), (-10867, -17427, 110));
    SpawnFlag((-11628, -17750, 222), (-12761, -17042, -10));

    // Spawn Ziplines
    SpawnZipline((-11275, -13956, 95), (-11329, -13061, 41));
    SpawnZipline((-7633, -16345, 258), (-10429, -16723, 28));

    // Spawn Boost
    SpawnBoost((-10580, -12050, 66), 100);

    // Spawn door
    wait 1;
    SpawnDoor((-10745, -17467, 109), (-10781, -17284, 109), (0, 0, 200));
    SpawnDoor((-10180, -17160, 141), (-10302, -16974, 141), (0, 0, 200));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (-11200, -16588, 27), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (-10627, -18717, 72), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (-9013, -17051, 119), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (-10731, -14763, 32), level.wallWeaponCost);
    SpawnMysteryBox((-10742, -11977, 53), (0, 90, 0));
}