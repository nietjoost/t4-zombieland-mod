// Classes
GivePlayerClass()
{
    self ClearPerks();
    self TakeAllWeapons();
    self GiveWeapon("doublebarrel");
    self SwitchToWeapon("doublebarrel");
}


GiveZombieClass()
{
    self ClearPerks();
    self TakeAllWeapons();
    //self GiveWeapon(weapon);
}