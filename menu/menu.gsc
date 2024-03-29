#include scripts\mp\menu\menuui;
#include scripts\mp\menu\menubuylogic;
#include scripts\mp\menu\menuutils;
#include scripts\mp\menu\hostutils;
#include scripts\mp\hud\playermessage;
#include scripts\mp\hud\healthlogic;
#include scripts\mp\killstreaks\jetpack;
#include scripts\mp\utils\utils;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

PlayerSetupMenu()
{
    // Check for running mod
	if (level.stopZombieLand == true)
    {
		return;
    }
    
    wait 0.1;
    self DefineVariables();
    self thread MenuBase();
}

DefineVariables()
{
    self.menu["curs"] = 0;
    self.menu["currentMenu"] = "";
    self.menu["isLocked"] = false;
 
    self.playerSetting = [];
    self.playerSetting["verfication"] = "";
    self.playerSetting["isInMenu"] = false;
}

ResetMenu()
{
    self.menu["items"] = undefined;
    self.menu = undefined;
    self.temp = undefined;
    self.playerSetting = undefined;
}

MenuBase()
{
    while (self.menuAlive)
    {
        if( !self getLocked())
        {
            if (!self getUserIn() )
            {
                if(self adsButtonPressed() && self meleeButtonPressed())
                {
                    // Check for running mod
                    if (level.stopZombieLand == true)
                    {
                        return;
                    }

                    self ResetMenu();
                    self DefineVariables();
                    self RunMenuIndex();
                    wait 0.01;
                    self ControlMenu("open", "main");
                }
            }
            else
            {
                if( self attackButtonPressed() || self adsButtonPressed() )
                {
                    self.menu["curs"] += self attackButtonPressed();
                    self.menu["curs"] -= self adsButtonPressed();

                    if( self.menu["curs"] > self.menu["items"][self getCurrent()].name.size-1 )
                        self.menu["curs"] = 0;
                    if( self.menu["curs"] < 0 )
                        self.menu["curs"] = self.menu["items"][self getCurrent()].name.size-1;

                    self thread scrollMenu();
                    wait 0.2;
                }

                if( self useButtonPressed() )
                {
                    self thread [[self.menu["items"][self getCurrent()].func[self getCursor()]]] (
                        self.menu["items"][self getCurrent()].input1[self getCursor()],
                        self.menu["items"][self getCurrent()].input2[self getCursor()],
                        self.menu["items"][self getCurrent()].input3[self getCursor()]
                    );

                    wait 0.2;
                }

                if( self meleeButtonPressed() )
                {
                    if( isDefined(self.menu["items"][self getCurrent()].parent) )
                    {
                        self ControlMenu("newMenu", self.menu["items"][self getCurrent()].parent);
                    }
                    else
                    {
                        self ControlMenu("close");
                    }
                    wait 0.2;
                }
            }
        }
        wait .05;
    }
}

scrollMenu()
{
    if(!isDefined(self.menu["items"][self getCurrent()].name[self getCursor()-3]) || self.menu["items"][self getCurrent()].name.size <= 9)
    {
        for(m = 0; m < 9; m++)
                self.menu["ui"]["text"][m] setText(self.menu["items"][self getCurrent()].name[m]);
        self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][self getCursor()].y);

       for( a = 0; a < 9; a ++ )
        {
            if( a != self getCursor() )
                self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
        }
        self.menu["ui"]["text"][self getCursor()] affectElement("alpha", 0.18, 1);
    }
    else
    {
        if(isDefined(self.menu["items"][self getCurrent()].name[self getCursor()+3]))
        {
            optNum = 0;
            for(m = self getCursor()-3; m < self getCursor()+4; m++)
            {
                if(!isDefined(self.menu["items"][self getCurrent()].name[m]))
                    self.menu["ui"]["text"][optNum] setText("");
                else
                    self.menu["ui"]["text"][optNum] setText(self.menu["items"][self getCurrent()].name[m]);
                optNum++;
            }
            if( self.menu["ui"]["scroller"].y != self.menu["ui"]["text"][3].y )
                self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][3].y);
            if( self.menu["ui"]["text"][3].alpha != 1 )
            {
                for( a = 0; a < 9; a ++ )
                    self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
                self.menu["ui"]["text"][3] affectElement("alpha", 0.18, 1);
            }
        }
        else
        {
            for(m = 0; m < 9; m++)
                self.menu["ui"]["text"][m] setText(self.menu["items"][self getCurrent()].name[self.menu["items"][self getCurrent()].name.size+(m-9)]);
            self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][((self getCursor()-self.menu["items"][self getCurrent()].name.size)+9)].y);
            for( a = 0; a < 9; a ++ )
            {
                if( a != ((self getCursor()-self.menu["items"][self getCurrent()].name.size)+9) )
                    self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
            }
            self.menu["ui"]["text"][((self getCursor()-self.menu["items"][self getCurrent()].name.size)+9)] affectElement("alpha", 0.18, 1);
        }
    }
}

ControlMenu( type, par1 )
{
    if (self IsHuman())
    {
        color = (0, 0.5, 0);
    }
    else
    {
        color = (0.5, 0, 0);
    }

    if( type == "open" )
    {
        self.menu["ui"]["background"] Destroy();
        self.menu["ui"]["scroller"] Destroy();
        self.menu["ui"]["barTop"] Destroy();

        self.menu["curs"] = 0;
        self.menu["ui"]["background"] = self createRectangle("CENTER", "CENTER", 0, 0, 210, 200, (0, 0, 0), 1, 0, "white");
        self.menu["ui"]["scroller"] = self createRectangle("CENTER", "CENTER", 0, -40, 210, 20, color, 2, 0, "white");
        self.menu["ui"]["barTop"] = self createRectangle("CENTER", "CENTER", 0, -75, 0, 35, color, 3, 0, "white");
        self.menu["ui"]["background"] affectElement("alpha", .2, .5);
        self.menu["ui"]["scroller"] affectElement("alpha", .2, .9);
        self.menu["ui"]["barTop"] affectElement("alpha", .1, .9);
        self.menu["ui"]["barTop"] scaleOverTime(.3, 210, 35);
        wait .2;
        self buildTextOptions(par1);

        self.playerSetting["isInMenu"] = true;
    }
    if( type == "close" )
    {
        self.menu["isLocked"] = true;
        self ControlMenu("close_animation");
        self.menu["ui"]["background"] scaleOverTime(.3, 210, 0);
        self.menu["ui"]["scroller"] scaleOverTime(.3, 0, 20);
        self.menu["ui"]["barTop"] scaleOverTime(.3, 0, 35);
        wait .2;
        self.menu["ui"]["background"] affectElement("alpha", .2, .1);
        self.menu["ui"]["scroller"] affectElement("alpha", .2, .1);
        self.menu["ui"]["barTop"] affectElement("alpha", .2, .1);
        wait .2;
        self.menu["ui"]["background"] destroy();
        self.menu["ui"]["scroller"] destroy();
        self.menu["ui"]["barTop"] destroy();
        self.menu["curs"] = 0;
        self.menu["isLocked"] = false;
        self.playerSetting["isInMenu"] = false;
    }
    if( type == "newMenu")
    {
        self.menu["isLocked"] = true;
        self ControlMenu("close_animation");
        self.menu["curs"] = 0;
        self buildTextOptions(par1);
        self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][self getCursor()].y);
        self.menu["isLocked"] = false;
    }
    if( type == "lock" )
    {
        self ControlMenu("close");
        self.menu["isLocked"] = true;
    }
    if( type == "unlock" )
    {
        self ControlMenu("open");
    }

    if( type == "close_animation" )
    {
        self.menu["ui"]["title"] affectElement("alpha", .2, 0);
        for( a = 9; a >= 0; a-- )
        {
            self.menu["ui"]["text"][a] affectElement("alpha", .2, 0);
            wait .05;
        }
        for( a = 9; a >= 0; a-- )
            self.menu["ui"]["text"][a] destroy();
        self.menu["ui"]["title"] destroy();
    }
}

buildTextOptions(menu)
{
    self.menu["currentMenu"] = menu;
    self.menu["ui"]["title"] = self createText(1.5, 5, self.menu["items"][menu].title, "CENTER", "CENTER", 0, -75, 0);
    self.menu["ui"]["title"] affectElement("alpha", .2, 1);
    for( a = 0; a < 9; a ++ )
    {
        self.menu["ui"]["text"][a] = self createText(1.2, 5, self.menu["items"][menu].name[a], "CENTER", "CENTER", 0, -40+(a*20), 0);
        self.menu["ui"]["text"][a] affectElement("alpha", .2, .3);
        wait .05;
    }
    self.menu["ui"]["text"][0] affectElement("alpha", .2, 1);
}

//Menu utilities
addMenu(menu, title, parent)
{
    if( !isDefined(self.menu["items"][menu]) )
    {
        self.menu["items"][menu] = spawnstruct();
        self.menu["items"][menu].name = [];
        self.menu["items"][menu].func = [];
        self.menu["items"][menu].input1 = [];
        self.menu["items"][menu].input2 = [];
        self.menu["items"][menu].input3 = [];

        self.menu["items"][menu].title = title;

        if( isDefined( parent ) )
            self.menu["items"][menu].parent = parent;
        else
            self.menu["items"][menu].parent = undefined;
    }

    self.temp["memory"]["menu"]["currentmenu"] = menu;
}

addMenuPar(name, func, input1, input2, input3)
{
    menu = self.temp["memory"]["menu"]["currentmenu"];
    count = self.menu["items"][menu].name.size;
    self.menu["items"][menu].name[count] = name;
    self.menu["items"][menu].func[count] = func;
    if( isDefined(input1) )
        self.menu["items"][menu].input1[count] = input1;
    if( isDefined(input1) )
        self.menu["items"][menu].input2[count] = input2;
    if( isDefined(input1) )
        self.menu["items"][menu].input3[count] = input3;
}

RunMenuIndex()
{
    if (self.type == "human")
    {
        self thread RunHumanShop();
    }
    else
    {
        self thread RunZombieShop();
    }
}

RunHumanShop()
{
    self addmenu("main", "^2Human shop");

    // Main menu
    self addMenuPar("Ammo shop", ::ControlMenu, "newMenu", "ammo_menu");
    self addMenuPar("Weapon shop", ::ControlMenu, "newMenu", "weapon_menu");
    self addMenuPar("Perk shop", ::ControlMenu, "newMenu", "perk_menu");
    self addMenuPar("Killstreak shop", ::ControlMenu, "newMenu", "killstreak_menu");
    self addMenuPar("Specials shop", ::ControlMenu, "newMenu", "specials_menu");
    self addMenuPar("Debug menu", ::ControlMenu, "newMenu", "debug_menu");

    // Ammo menu
    self addmenu("ammo_menu", "^5Ammo shop", "main");
    self addMenuPar("Max ammo current weapon" + self thread GetMenuBuyText(level.buyMaxAmmoCurrentWeapon), ::BuyMaxAmmoCurrentWeapon);
    self addMenuPar("Max ammo all weapons" + self thread GetMenuBuyText(level.buyMaxAmmoAllWeapons), ::BuyMaxAmmoAllWeapons);
    self addMenuPar("Grenade" + self thread GetMenuBuyText(level.buyGrenadeCost), ::BuyGrenade);
    self addMenuPar("Sticky grenade" + self thread GetMenuBuyText(level.buyGrenadeCost), ::BuyStickyGrenade);
    self addMenuPar("Molotov" + self thread GetMenuBuyText(level.buyGrenadeCost), ::BuyMolotov);

    // Weapon menu
    self addmenu("weapon_menu", "^5Weapon shop", "main");
    self addMenuPar("Upgrade current weapon" + self thread GetMenuBuyText(level.upgradeWeaponsMoney), ::UpgradeWeapon);
    self addMenuPar("Thompson" + self thread GetMenuBuyText(level.weapons["thompson_mp"]["money"]), ::GiveThompson);
    self addMenuPar("Type 100" + self thread GetMenuBuyText(level.weapons["type100smg_mp"]["money"]), ::GiveType100);
    self addMenuPar("Ppsh" + self thread GetMenuBuyText(level.weapons["ppsh_mp"]["money"]), ::GivePpsh);
    self addMenuPar("M1 Garand" + self thread GetMenuBuyText(level.weapons["m1garand_mp"]["money"]), ::GiveM1Garand);
    self addMenuPar("Stg44" + self thread GetMenuBuyText(level.weapons["stg44_mp"]["money"]), ::GiveStg44);
    self addMenuPar("Fg42" + self thread GetMenuBuyText(level.weapons["fg42_mp"]["money"]), ::GiveFg42);

    // Perk menu
    self addmenu("perk_menu", "^5Perk shop", "main");
    self addMenuPar("Buy next perk" + self thread GetMenuBuyText(level.perksMoney), ::GivePerkNext);
    self addMenuPar("Sleight of Hand" + self thread GetMenuBuyText(level.perksMoney), ::GivePerkSleight);
    self addMenuPar("Extreme Conditioning" + self thread GetMenuBuyText(level.perksMoney), ::GivePerkSprint);
    self addMenuPar("Stopping Power" + self thread GetMenuBuyText(level.perksMoney), ::GivePerkStoppingPower);

    // Killstreak menu
    self addmenu("killstreak_menu", "^5Killstreak shop", "main");
    self addMenuPar("UAV" + self thread GetMenuBuyText(level.uavCost), ::GiveUav);
    self addMenuPar("Artillery" + self thread GetMenuBuyText(level.artilleryCost), ::GiveArtillery);
    self addMenuPar("Dogs" + self thread GetMenuBuyText(level.dogsCost), ::GiveDogs);
    self addMenuPar("Insta Kill" + self thread GetMenuBuyText(level.buyInstaKill), ::BuyInstaKill);
    self addMenuPar("Slower zombies" + self thread GetMenuBuyText(level.slowerZombiesCost), ::SlowerZombies);
    self addMenuPar("JetPack" + self thread GetMenuBuyText(level.buyJetPack), ::BuyJetPack);
    self addMenuPar("Predator missile" + self thread GetMenuBuyText(level.BuyPredator), ::BuyPredator);

    // Special menu
    self addmenu("specials_menu", "^5Specials shop", "main");
    self addMenuPar("Extra health" + self thread GetMenuBuyText(level.buyHealthCost), ::AddHealthMenu);
    self addMenuPar("Freeze Zombies" + self thread GetMenuBuyText(level.freezeZombiesCost), ::FreezeZombies);
    self addMenuPar("Block ZipLines" + self thread GetMenuBuyText(level.blockZiplinesCost), ::BlockZiplines);
    self addMenuPar("Teleport selector" + self thread GetMenuBuyText(level.buyTeleport), ::BuyTeleportPlayer);
    self addMenuPar("Increase walk speed" + self thread GetMenuBuyText(level.buyIncreaseSpeed), ::BuyIncreaseSpeed);

    // DEBUG MENU
    if (self.name != level.players[0].name)
    {
        return;
    }

    self addmenu("debug_menu", "^5Debug menu", "main");
    self addMenuPar("Stop ^1ZombieLand", ::StopZombieLand);
    self addMenuPar("Kill all players", ::KillAllPlayersMenu);
    self addMenuPar("Force Host", ::ForceHost);
}

RunZombieShop()
{
    self addmenu("main", "^1Zombie shop");

    // General Zombie shop
    self addMenuPar("Extra health" + self thread GetMenuBuyText(level.buyHealthZombieCost), ::AddHealthZombieMenu);
    self addMenuPar("Grenade" + self thread GetMenuBuyText(level.buyGrenadeCost), ::BuyGrenade);
    self addMenuPar("Teleport selector" + self thread GetMenuBuyText(level.buyTeleport), ::BuyTeleportPlayer);
    self addMenuPar("Invisible 20 seconds" + self thread GetMenuBuyText(level.buyInvisible), ::BuyInvisible);
    self addMenuPar("JetPack 40 seconds" + self thread GetMenuBuyText(level.buyJetPackZombie), ::BuyJetPackZombie);
}