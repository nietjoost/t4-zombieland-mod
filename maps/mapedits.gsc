#include scripts\mp\events\checkziplines;
#include scripts\mp\events\checkhintstring;
#include scripts\mp\events\wallweaponlogic;

// Load the map
LoadMap()
{
    wait 5;

    // Get the mapname
    mapName = GetDvar("mapname");

    if (mapName == "mp_airfield")
        scripts\mp\maps\mp_airfield::Load();

    if (mapName == "mp_asylum")
        scripts\mp\maps\mp_asylum::Load();

    if (mapName == "mp_castle")
        scripts\mp\maps\mp_castle::Load();

    // Check for teleport flags
    level thread CheckZiplines();
    level thread HandleWallWeapon();
    level thread CheckHintString();

    // BACKUP code
    // CreateFloor(level.collisionModel, (3139, 282, -52), (3366, 494, -52), self.angles, 35, 35, 60);
    // CreateElevator(level.collisionModel, (3346, 2606, -61), (3346, 2606, 505), (0,0,0), 10, 2);
}