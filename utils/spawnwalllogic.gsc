#include scripts\mp\hud\playermessage;

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
                block = SpawnEntityy("script_model", model, start + (originx * l, originy * w, originz * h), (0, 0, 0));                   
                block LinkTo(center);
            }
        }
    }
    
    center.angles = angles;
}

// Spawn a solid barrel
SpawnSolid(location, angles)
{
    block = SpawnEntity("script_model", level.collisionModel, location, angles);
	solid = spawn("trigger_radius",location,0,64,50);
	solid setContents(1);
	solid.targetname = "script_collision";
}


SpawnEntity(class, model, origin, angles)
{
    entity = Spawn(class, origin);
    entity.angles = angles;
    entity SetModel(model);
   	
    return entity;
}

SpawnEntityy(class, model, origin, angles)
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