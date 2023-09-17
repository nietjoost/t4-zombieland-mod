#include scripts\mp\hud\playermessage;

// Door logic
SpawnDoor(start, end, doorPos)
{
    door = CreateDoor(level.collisionModel, start, end, 35);                    

    doorTrigger = spawn("trigger_radius", door[0].origin, 0, 150, 150);
    doorTrigger thread WatchDoorHealth(door, doorPos);
}


WatchDoorHealth(door, doorPos)
{
    doorHealth = 2;

    while(1)
    {
        level endon ("stop_zombieland");
        self waittill("trigger", player);
        if (player MeleeButtonPressed())
        {
            doorHealth -= 1;

            player thread PlayerMessageLeftUnder("^5You did ^110 damage ^5to the ^2door!");
            if (doorHealth == 0)
            {
                player thread PlayerMessageMiddle("^2The door is broken!");
                door[0] MoveTo(door[0].origin + doorPos, 2);
                self Delete();

                for (i = 0; i < door.size; i++)
                {
                    door[i].solid setContents(0);
                }
            }
            wait 0.7;
        }
    }
}


// Spawn objects logic
CreateDoor(model, start, end, lengthspace)
{
    length = Distance(start, end);
   	blockslength = Ceil(length / lengthspace);
    blocks = [];

    for (l = 0; l < blockslength; l ++)
    {
        blocks[l] = SpawnDoorEntity("script_model", model, (start + ((end - start) / blockslength) * l), VectorToAngles(start - end));
        
        if (l !=0) blocks[l] LinkTo(blocks[0]);
    }

    return blocks;
}

SpawnDoorEntity(class, model, origin, angles)
{
    entity = Spawn(class, origin);
    entity.angles = angles;
    entity SetModel(model);
    entity.pickup = false;
    solid = spawn("trigger_radius",origin,0,64,50);
	solid setContents(1);
	solid.targetname = "script_collision";
    solid LinkTo(entity);
    entity.solid = solid;
   	level.amountofmodels++;
    
    level.spawnedModels[level.spawnedModelsCount] = entity;
	level.spawnedModelsCount++;

    level.spawnedModels[level.spawnedModelsCount] = solid;
	level.spawnedModelsCount++;

    return entity;
}