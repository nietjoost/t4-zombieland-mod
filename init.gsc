// Includes
#include scripts\mp\utils\settings;
#include scripts\mp\utils\hostscripts;
#include scripts\mp\events\playerconnect;
#include scripts\mp\events\playerconnecterror;


// Main script
init()
{
    level.prefix = "^1[ZombieLand]^7 ";

    // Check server settings
    if (GetDvar("g_gametype") != "tdm")
    {
        level thread OnPlayerConnectError();
        return;
    }

    // ZombieLand scripts
    level thread SetupSettings();
    level thread OnPlayerConnect();

    for(;;)
	{
        level.prematchPeriod = 0;
		wait 1;
		level.onForfeit = scripts\mp\init::FixForfeit;
	}
}

// Empty function
FixForfeit()
{

}