#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\moneylogic;
#include scripts\mp\menu\menubuylogic;
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
    door[0].doorHealth = level.doorHealth;

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

            door[0].doorHealth -= level.doorDamage;

            player thread PlayerMessageLeftUnder("^2You did ^1" + level.doorDamage + " damage");
            player thread AddMoney(level.doorDamageCost);
            player thread PlayerMessageLeftUnder("Door Health [^2" + door[0].doorHealth + " ^7/^1" + level.doorHealth + "^7]");
            if (door[0].doorHealth == 0)
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
                    p.subHint = "[^2" + door[0].doorHealth + " ^7/^1" + level.doorHealth + "^7] Hold ^1[[{+activate}]] ^7to repair the door cost: ^7[^2" + level.doorRepairCost + "^7]";
                }
                else
                {
                    p.hint = "^5Hold ^1[[{+melee}]] ^5to close the door";
                    p.subHint = "";
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

                if(p UseButtonPressed())
                {
                    if(door[0].doorHealth == level.doorHealth)
                    {
                        p PlayerMessageMiddle("^1The door is already at max health!");
                        continue;
                    }
                    
                    if (p thread CheckMoney(level.doorRepairCost))
                    {
                        continue;
                    }

                    p PlayerMessageLeftUnder("^2You repaired the door!");
                    door[0].doorHealth = level.doorHealth;
                    wait 1;
                }
            }

            // Remove the hintstring
            if (Distance(p.origin, self.origin) > 100 && Distance(p.origin, self.origin) < 300)
            {
                p.hint = "";
                p.subHint = "";
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