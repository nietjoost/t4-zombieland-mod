// Load the map
LoadMap()
{
    // Get the mapname
    mapName = GetDvar("mapname");

    if (mapName == "mp_airfield")
    {
        scripts\mp\maps\mp_airfield::Load();
    }
}