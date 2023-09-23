#include scripts\mp\hud\moneylogic;
#include scripts\mp\utils\player;
#include scripts\mp\events\gamelogic;

// PLAYER KILLED event
OnPlayerKilled(_self, inflictor, attacker, type, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
{
    //DEBUG
    //_self iPrintLn(_self);
    //_self iPrintLn(inflictor);
    //_self iPrintLn(attacker);

    // Check for running mod
	if (level.stopZombieLand == true)
    {
		return;
    }

    // Logic
    if (type == "MOD_SUICIDE")
    {
        return;
    }

    if (_self.type == "human")
    {
        _self thread AddMoney(level.humanKillMoney);
    }
    else
    {
        _self thread AddMoney(level.zombieKillMoney);
    }
    _self.kills++;

    // Check END
    wait 15;
    CheckEnd();
}