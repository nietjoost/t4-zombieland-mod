#include scripts\mp\hud\playermessage;
#include scripts\mp\events\elevatorlogic;

// Spawn a floor
CreateFloor(model, start, end, angles, lengthspace, widthspace, heightspace)
{
	start += (0, 0, heightspace / 2);
	end += (0, 0, heightspace / 2);
	length = Distance((start[0], 0, 0), (end[0], 0, 0));
    width = Distance((0, start[1], 0), (0, end[1], 0));
    height = Distance((0, 0, start[2]), (0, 0, end[2]));
    blockslength = Ceil(length / lengthspace);
    blockswidth = Ceil(width / widthspace);
    blocksheight = Ceil(height / heightspace);
    originx = (end[0] - start[0]) / blockslength;
    originy = (end[1] - start[1]) / blockswidth;
    originz = (end[2] - start[2]) / blocksheight;
    center = Spawn("script_origin", start);
    
    for (l = 0; l <= blockslength; l ++)
    {
        for (w = 0; w <= blockswidth; w ++)
        {
            for (h = 0; h <= blocksheight; h ++)
            {
                block = SpawnEntity("script_model", model, start + (originx * l, originy * w, originz * h), (0, 0, 0));                   
                block LinkTo(center);
            }
        }
    }
    
    center.angles = angles;
}

//Spawn a ramp
CreateRamp(model, start, end, lengthspace)
{
    length = Distance(start, end);
   	blockslength = Ceil(length / lengthspace);

    for (l = 0; l < blockslength; l ++)
    {
        block = SpawnEntity("script_model", model, (start + ((end - start) / blockslength) * l), VectorToAngles(start - end));
    }
}

//Create elevator
CreateElevator(model, start, end, angles, duration, waitduration)
{
    elevator = SpawnEntity("script_model", model, start, angles);
    elevatorscriptorigin = Spawn("script_model", start);
    elevator EnableLinkTo();
	elevator LinkTo(elevatorscriptorigin);
    solid = spawn("trigger_radius",start,0,64,50);
	solid setContents(1);
	solid.targetname = "script_collision";
    elevatorscriptorigin thread ElevatorMonitor(solid, start, end, duration, waitduration);
}

// Spawn function
SpawnEntity(class, model, origin, angles)
{
    entity = Spawn(class, origin);
    entity.angles = angles;
    entity SetModel(model);
    entity.pickup = false;
    solid = spawn("trigger_radius",origin,0,64,50);
	solid setContents(1);
	solid.targetname = "script_collision";
   	level.amountofmodels ++;
   	
    return entity;
}