#include scripts\mp\hud\moneylogic;
#include scripts\mp\utils\player;

// PLAYER KILLED event
OnPlayerKilled(_self, inflictor, attacker, type, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
{
    //DEBUG
    //_self iPrintLn(_self);
    //_self iPrintLn(inflictor);
    //_self iPrintLn(attacker);

    // Logic
    if (type == "MOD_SUICIDE")
    {
        return;
    }

    _self thread AddMoney(500);
}