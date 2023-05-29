// Include
#include scripts\mp\hud\playermessage;
#include scripts\mp\events\gamelogic;

// PLAYER connect functions
OnPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);

        player.spawned = false;
        player.type = "human";
        player.money = 500;
        //ArrayAdd(level.playersList, player);
        player thread OnPlayerSpawned();   

        level.players++;
        level thread StartZombieLand();                    
    }
}


// ON Player spawn logic
OnPlayerSpawned()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        if (self.spawned == false && level.started == true && self.type == "human")
        {
            self.type = "zombie";
            self ChangeTeam();
            continue;
        }

        // Messages connect and logic
        if (self.spawned == false)
        {
            self.spawned = true;
            self thread playermessagemiddle("^5Welcome to ^2RooieRonnie's ^1ZombieLand^5!");

            if (self.type == "human")
            {
                wait 1;
                self thread playermessagemiddle("^3You are a Human! ^5Survive the ^1zombies ^5to win!");
            }
            else
            {
                self thread playermessagemiddle("^1You are a zombie now!");
            }
        }
    }
}


// CHANGE TEAM Logic
ChangeTeam()
{
    wait 0.1;
    if(isAlive(self))
	{	
        self.switching_teams = true;
		self.joining_team = "axis";
		self.leaving_team = self.pers["team"];
		self suicide();
	}
	self.pers["team"] = "axis";
	self.team = "axis";
}