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
    {
        scripts\mp\maps\mp_airfield::Load();
    }

    // Check for teleport flags
    level thread CheckZiplines();
    level thread HandleWallWeapon();
    level thread CheckHintString();
}