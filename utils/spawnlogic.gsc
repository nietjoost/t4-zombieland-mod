#include scripts\mp\events\checkflags;

// SPAWN OBJECTS Logic
SpawnFlag(pos1, pos2, showIcon)
{
    if (!IsDefined(showIcon))
        showIcon = true;

    // Spawn model
    startFlag = Spawn("script_model", pos1);
    startFlag SetModel(level.flag);
    startFlag.pos1 = pos1;
    startFlag.pos2 = pos2;

    // Spawn FX
    fx = PlayFX(level.flagFx, pos1);
    level.spawnedModels[level.spawnedModels.size] = fx;

    // Spawn UI Icon
    if (showIcon)
    {
        objective_add(level.objectId, "active", "invisible", 0, 0, 0);
        objective_icon(level.objectId, "waypoint_flag");
        objective_state(level.objectId, "active");
        objective_position(level.objectId, pos1);
        level.objectId++;
    }
    
    //Check TP
    level thread CheckFlags(startFlag);

    level.spawnedModels[level.spawnedModels.size] = startFlag;
}


// SPAWN ZipLine
SpawnZipline(pos1, pos2)
{
    level thread SpawnZiplineBoth(pos1, pos2);
    wait 0.1;
    level thread SpawnZiplineBoth(pos2, pos1);
}

SpawnZiplineBoth(pos1, pos2)
{
    //Spawn hint string [needs model]
    zipline = Spawn("script_model", pos1);
    zipline SetModel(level.zipline);
    zipline.pos2 = pos2;
    level.ziplines[level.ziplines.size] = zipline;

    // Spawn FX
    fx = PlayFX(level.ziplineFx, pos1);
    level.spawnedModels[level.spawnedModels.size] = fx;	

    // Spawn UI Icon
    objective_add(level.objectId, "active", "invisible", 0, 0, 0);
    objective_icon(level.objectId, "waypoint_flag");
    objective_state(level.objectId, "active");
    objective_position(level.objectId, pos1);
    level.objectId++;

    level.spawnedModels[level.spawnedModels.size] = zipline;
}

// Spawn Booster
SpawnBoost(pos, height)
{
    // Spawn Model
    booster = Spawn("script_model", pos);
	booster SetModel(level.boost);
    level.spawnedModels[level.spawnedModels.size] = booster;
	
	wait .05;

    // Spawn FX
    fx = PlayFX(level.boostFx, pos);
    level.spawnedModels[level.spawnedModels.size] = fx;

    // Spawn UI Icon
    objective_add(level.objectId, "active", "invisible", 0, 0, 0);
    objective_icon(level.objectId, "waypoint_flag");
    objective_state(level.objectId, "active");
    objective_position(level.objectId, pos);
    level.objectId++;

	wait .05;
	level thread CheckBooster(pos, height);
}

CheckBooster(pos, height)	
{
	while(1)
	{
        level endon ("stop_zombieland");
        
        players = level.players;
		for ( index = 0; index < players.size; index++ )
		{
            player = players[index];
			if (Distance(pos, player.origin) <= 50)
			{
                player SetOrigin(pos);
				player thread BoostPlayerUp(pos, height);
				player PlaySound("artillery_launch");
				wait 3;
			}
			wait 0.01;
		}
		wait 1;
	}
}

BoostPlayerUp(pos, height)
{
	posa = self.origin;
	fpos = posa[2] + height;
	h = 0;
	for(j=1; self.origin[2] < fpos; j+=j)
	{
		if(j > 130) j=130;
		h = h + j;
		self SetOrigin((pos) + (0,0,h));
		wait .1;
	}
	vec = AnglesToForward(self GetPlayerAngles());
	end = (vec[0] * 160, vec[1] * 160, vec[2] * 10);
	so = self.origin;
    soh = so + (0,0,60);
	
    if (BulletTracePassed(so, so + end, false, self) && BulletTracePassed(soh, soh + end, false, self)) 
    {
        self SetOrigin(self.origin + end);
    }
}