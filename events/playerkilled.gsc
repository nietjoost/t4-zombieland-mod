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
	if (level.stopZombieLand)
		return;

    // Logic
    if (type == "MOD_SUICIDE")
        return;

    _self thread AddMoney(500);

    // Check END
    wait 15;
    CheckEnd();
}