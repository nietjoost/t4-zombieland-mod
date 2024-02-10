#include scripts\mp\hud\moneylogic;

// Insta kill code
CheckInstaKillHealth(killer)
{
	level endon ("game_ended");
	level endon ("stop_zombieland");

	while(killer.hasInstaKill)
	{
		self waittill ( "damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags );
		if(attacker.team != "axis" && self.isInMegaZombie == false)
		{
			self DoDamage(self.health + 9999, attacker.origin);
            killer thread AddMoney(level.humanKillMoney);
		}
		wait 1;
	}
}