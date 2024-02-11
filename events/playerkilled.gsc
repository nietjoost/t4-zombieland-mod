#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\playermessage;
#include scripts\mp\menu\menu;
#include scripts\mp\utils\player;
#include scripts\mp\utils\utils;
#include scripts\mp\events\gamelogic;

// PLAYER KILLED event
OnPlayerKilled(_self, inflictor, attacker, type, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
{
    //DEBUG
    //_self iPrintLn("self: " + _self.name);
    //_self iPrintLn(inflictor);
    //_self iPrintLn("attacker: " + attacker.name);

    // Check for running mod
	if (level.stopZombieLand == true)
    {
		return;
    }

    // Logic
    self thread ControlMenu("close");
    self.menuAlive = false;
    self.hasJetPack = false;

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

    if (_self.kills % 10 == 0)
    {
        _self thread maps\mp\gametypes\_hud_message::oldNotifyMessage("^1You are on a rampage!", "^2Extra money is earned!", undefined, (1, 0, (55 / 255)), "mp_level_up", 5);
        _self thread GivePlayerMoney(level.rampageExtraCash);
    }

    // Surviving money
    if (_self.type == "zombie")
    {
        if (_self.name != attacker.name)
        {
            humans = GetPlayerHumans();
            for ( i = 0; i < humans.size; i++ )
            {
                p = humans[i];
                p thread PlayerMessageMiddle("You got ^2$" + level.humanSurvivingBonus + " ^7Survivor ^5Bonus!");
                p thread AddMoney(level.humanSurvivingBonus);
            }
        }
    }

    // Check END
    wait 15;
    CheckEnd();
}