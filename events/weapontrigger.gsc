nukegun()
{
    self endon ("disconnect");
    for(;;)
    {
        level endon ("stop_zombieland");
        self waittill("weapon_fired");
        trace=bullettrace(self gettagorigin("j_head"),self gettagorigin("j_head")+anglestoforward(self getplayerangles())*100000,1,self)["position"];
        nuke=loadfx("maps/mp_maps/fx_mp_nuked_nuclear_explosion");
        fx = playfx(nuke,trace);
        level.spawnedModels[level.spawnedModelsCount] = fx;
	    level.spawnedModelsCount++;
        self playsound("amb_end_nuke");
        radiusdamage(trace,1000,2000,900,self);
    }
}