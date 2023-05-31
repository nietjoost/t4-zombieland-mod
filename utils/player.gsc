// Classes
GivePlayerClass()
{
    self clearPerks();
    self takeAllWeapons();
    self giveWeapon("mp40_mp");
    self giveMaxAmmo("mp40_mp");
    self switchToWeapon("mp40_mp");

    self giveWeapon("colt_mp");
    self giveMaxAmmo("colt_mp");

    self FreezeControls(false);
}


GiveZombieClass()
{
    self ClearPerks();
    self TakeAllWeapons();
    self giveWeapon("colt_mp");
    self switchToWeapon("colt_mp");
    self setWeaponAmmoStock("colt_mp", 0);
    self setWeaponAmmoClip("colt_mp", 0);
}


// CHANGE TEAM Logic
ChangeTeam(team)
{
    wait 0.1;
    if(isAlive(self))
	{
        self.switching_teams = true;
		self.joining_team = team;
		self.leaving_team = self.pers["team"];
		self suicide();
	}
	self.pers["team"] = team;
	self.team = team;
}