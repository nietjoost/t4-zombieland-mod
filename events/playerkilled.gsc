#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\playermessage;
#include scripts\mp\utils\player;
#include scripts\mp\utils\utils;
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

    // Surviving money
    humans = GetPlayerHumans();
    for ( i = 0; i < humans.size; i++ )
    {
        p = humans[i];
        p thread PlayerMessageMiddle("You got ^2$" + level.humanSurvivingBonus + " ^7Survivor ^5Bonus!");
        p thread AddMoney(level.humanSurvivingBonus);
    }

    // Check END
    wait 15;
    CheckEnd();
}