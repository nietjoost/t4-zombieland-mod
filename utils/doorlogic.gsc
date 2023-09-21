#include scripts\mp\hud\playermessage;
#include scripts\mp\utils\utils;

// Door logic
SpawnDoor(start, end, destroyLocation, openLocation)
{
    door = CreateDoor(level.collisionModel, start, end, 35);      

    doorTrigger = spawn("trigger_radius", door[0].origin, 0, 150, 150);
    doorTrigger.closed = true;
    doorTrigger.closedPos = doorTrigger.origin;
    doorTrigger thread WatchDoorHealth(door, destroyLocation);
    doorTrigger thread WatchDoorHuman(door, openLocation);
}


WatchDoorHealth(door, destroyLocation)
{
    doorHealth = level.doorHealth;

    while(1)
    {
        level endon ("stop_zombieland");
        self waittill("trigger", player);
        if (player MeleeButtonPressed())
        {
            if (player IsHuman() || self.closed == false)
            {
                continue;
            }

            doorHealth -= 10;

            player thread PlayerMessageLeftUnder("^2You did ^110 damage");
            player thread PlayerMessageLeftUnder("Door Health [^2" + doorHealth + " ^7/^1" + level.doorHealth + "^7]");
            if (doorHealth == 0)
            {
                player thread PlayerMessageMiddle("^2The door broke!");
                door[0] MoveTo(door[0].origin + destroyLocation, 2);
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

WatchDoorHuman(door, openLocation)
{
    while(1)
    {
        wait 0.1;
        for ( i = 0; i < level.players.size; i++ )
        {
            p = level.players[i];

            if (p IsHuman() == false)
            {
                continue;
            }

            if (Distance(p.origin, self.origin) <= 100)
            {
                if (self.closed)
                {
                    p.hint = "^5Hold ^1[[{+melee}]] ^5to open the door";
                }
                else
                {
                    p.hint = "^5Hold ^1[[{+melee}]] ^5to close the door";
                }

                // Check for BUTTON press
                if (p MeleeButtonPressed())
                {
                    wait 0.2;
                    if (p MeleeButtonPressed())
                    {
                        if (self.closed)
                        {                
                            door[0] MoveTo(openLocation, 2);
                            for (i = 0; i < door.size; i++)
                            {
                                door[i].solid setContents(0);
                            }
                            self.closed = false;
                        }
                        else
                        {
                            door[0] MoveTo(self.closedPos, 2);
                            wait 2;
                            for (i = 0; i < door.size; i++)
                            {
                                door[i].solid setContents(1);
                            }
                            self.closed = true;
                        }
                        wait 1;
                    }
                }
            }

            // Remove the hintstring
            if (Distance(p.origin, self.origin) > 100 && Distance(p.origin, self.origin) < 300)
            {
                p.hint = "";
            }
        }
    }
}

// Spawn objects logic
CreateDoor(model, start, end, lengthspace)
{
    length = Distance(start, end);
   	blockslength = Ceil(length / lengthspace);
    blocks = [];
    blocksCount = 0;

    for (l = 0; l < blockslength; l++)
    {
        blocks[blocksCount] = SpawnDoorEntity("script_model", model, (start + ((end - start) / blockslength) * l), VectorToAngles(start - end));    
        if (blocksCount !=0) blocks[blocksCount] LinkTo(blocks[0]);
        blocksCount++;
        blocks[blocksCount] = SpawnDoorEntity("script_model", model, (start + ((end - start) / blockslength) * l) + (0, 0, 70), VectorToAngles(start - end));
        blocks[blocksCount] LinkTo(blocks[0]);
        blocksCount++;
    }

    return blocks;
}

SpawnDoorEntity(class, model, origin, angles)
{
    entity = Spawn(class, origin);
    entity.angles = angles;
    entity SetModel(model);
    entity.pickup = false;
    solid = Spawn("trigger_radius",origin,0,64,50);
	solid SetContents(1);
	solid.targetname = "script_collision";
    solid LinkTo(entity);
    entity.solid = solid;
    
    level.spawnedModels[level.spawnedModels.size] = entity;
    level.spawnedModels[level.spawnedModels.size] = solid;
    return entity;
}