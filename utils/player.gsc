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