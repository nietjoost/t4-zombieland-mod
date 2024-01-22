#include scripts\mp\hud\moneylogic;
#include scripts\mp\hud\playermessage;
#include scripts\mp\menu\menu;
#include scripts\mp\utils\player;
#include scripts\mp\utils\utils;
#include scripts\mp\events\gamelogic;

// Player DAMAGE Event
OnPlayerDamage(_self, inflictor, attacker, type, mod, weapon, dir, hitloc, timeoffset, deathanimduration)
{
    _self iPrintLn("self: " + _self.name);
    attacker iPrintLn("self: " + _self.name);

    if (attacker.hasInstaKill == true && _self.isInMegaZombie == false)
    {
        _self DoDamage(99999, attacker.origin);
    }
}