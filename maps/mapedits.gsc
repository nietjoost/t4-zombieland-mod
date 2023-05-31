#include scripts\mp\utils\spawnlogic;

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
    level thread CheckFlags();
}