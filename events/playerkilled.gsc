// PLAYER KILLED event
OnPlayerKilled(_self, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration )
{
    _self.money = _self.money + 500;
    _self.hud_money setText("$" + _self.money);
}