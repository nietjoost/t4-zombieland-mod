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

    if (mapName == "mp_bgate")
        scripts\mp\maps\mp_bgate::Load();

    if (mapName == "mp_castle")
        scripts\mp\maps\mp_castle::Load();

    if (mapName == "mp_courtyard")
        scripts\mp\maps\mp_courtyard::Load();

    if (mapName == "mp_dome")
        scripts\mp\maps\mp_dome::Load();

    if (mapName == "mp_downfall")
        scripts\mp\maps\mp_downfall::Load();

    if (mapName == "mp_drum")
        scripts\mp\maps\mp_drum::Load();

    if (mapName == "mp_hangar")
        scripts\mp\maps\mp_hangar::Load();

    if (mapName == "mp_kneedeep")
        scripts\mp\maps\mp_kneedeep::Load();

    if (mapName == "mp_kwai")
        scripts\mp\maps\mp_kwai::Load();

    if (mapName == "mp_makin_day")
        scripts\mp\maps\mp_makin_day::Load();

    if (mapName == "mp_makin")
        scripts\mp\maps\mp_makin::Load();

    if (mapName == "mp_nachtfeuer")
        scripts\mp\maps\mp_nachtfeuer::Load();
           
    if (mapName == "mp_outskirts")
        scripts\mp\maps\mp_outskirts::Load();

    if (mapName == "mp_roundhouse")
        scripts\mp\maps\mp_roundhouse::Load();

    if (mapName == "mp_seelow")
        scripts\mp\maps\mp_seelow::Load();

    if (mapName == "mp_shrine")
        scripts\mp\maps\mp_shrine::Load();

    if (mapName == "mp_stalingrad")
        scripts\mp\maps\mp_stalingrad::Load();

    if (mapName == "mp_subway")
        scripts\mp\maps\mp_subway::Load();

    if (mapName == "mp_vodka")
        scripts\mp\maps\mp_vodka::Load();

    // Check for teleport flags
    level thread CheckZiplines();
    level thread CheckHintString();

    // BACKUP code
    // CreateFloor(level.collisionModel, (3139, 282, -52), (3366, 494, -52), self.angles, 35, 35, 60);
    // CreateElevator(level.collisionModel, (3346, 2606, -61), (3346, 2606, 505), (0,0,0), 10, 2);
    // SpawnTurret( "misc_turret", (320, 142, 26), "mg42_bipod_stand_mp");
}