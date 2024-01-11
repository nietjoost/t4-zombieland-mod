#include scripts\mp\utils\doorlogic;
#include scripts\mp\utils\mysterybox;
#include scripts\mp\utils\spawnlogic;
#include scripts\mp\utils\spawnwalllogic;
#include scripts\mp\events\wallweaponlogic;

// mp_roundhouse
Load()
{
    // Spawn flags
    SpawnFlag((607, -283, -479), (362, 57, -180));
    SpawnFlag((5677, -808, -408), (4945, -1950, 647));
    SpawnFlag((3490, -3427, -422), (3944, -4495, -126));

    // Spawn Ziplines
    SpawnZipline((163, -962, -342), (2014, -2003, -141));
    SpawnZipline((3654, 28, -413), (4557, -332, -412));
    SpawnZipline((3944, -4651, -126), (4496, -4662, -367));
    SpawnZipline((4865, -1553, -454), (5284, -4235, -367));
    
    // Spawn Boost
    SpawnBoost((4702, -799, -411), 800);

    // Spawn door
    wait 1;
    SpawnDoor((-607, -1625, -256), (-492, -1624, -256), (0, 0, 150));

    // Spawn weapons
    wait 1;
    CreateWallWeapon("thompson_mp", (484, -1225, -480), level.wallWeaponCost);
    CreateWallWeapon("bar_mp", (2040, -514, -479), level.wallWeaponCost);
    CreateWallWeapon("ppsh_bigammo_mp", (2641, -3302, -455), level.wallWeaponCost);
    CreateWallWeapon("fg42_telescopic_mp", (847, 398, -466), level.wallWeaponCost);
    SpawnMysteryBox((-251, -741, -320), (0, 45, 0));
}