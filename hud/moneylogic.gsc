// MONEY logic
CreateMoneyHUD()
{
    self.hud_money destroy();

    self.hud_money = newClientHudElem(self);
    self.hud_money.alignX = "left";
	self.hud_money.horzAlign = "left";
	self.hud_money.vertAlign = "center";
    self.hud_money.x = 20;
    self.hud_money.y = 190;
    self.hud_money.font = "objective";
    self.hud_money.fontscale = 2;
    self.hud_money.archived = false;
    self.hud_money.color = (0, 1, 0);
    self.hud_money.hidewhendead = true;
    self.hud_money.hidewheninmenu = true;
    self.hud_money SetText("Money: " + self.money);

    //if (self.type == "zombie")
    //{
        //self.hud_money.color = (1, 0, 0);
    //}
}

// MONEY animation
AnimateMoneyHUD(localMoney, color)
{
    self.hud_money_extra destroy();

    self.hud_money_extra = newClientHudElem(self);
    self.hud_money_extra.alignX = "left";
    self.hud_money_extra.alignY = "left";
    self.hud_money_extra.x = 10;
    self.hud_money_extra.y = 190;
    self.hud_money_extra.font = "objective";
    self.hud_money_extra.fontscale = 2.3;
    self.hud_money_extra.color = color;
    self.hud_money_extra SetText("$" + localMoney);
    self.hud_money_extra.hidewhendead = true;
    self.hud_money_extra.hidewheninmenu = true;
    self.hud_money_extra MoveOverTime(2);
    self.hud_money_extra FadeOverTime(2);
    self.hud_money_extra.x = RandomIntRange(130, 170);
    self.hud_money_extra.y = RandomIntRange(190, 260);

    wait 1.5;

    self.hud_money_extra destroy();
}

// ADD money
AddMoney(localMoney)
{
    self.money += localMoney;
    self thread CreateMoneyHUD();
    self thread AnimateMoneyHUD(localMoney, (0, 1, 0));
}

// REMOVE money
RemoveMoney(localMoney)
{
    self.money -= localMoney;
    self.hud_money SetText("Money: " + self.money);
    self thread AnimateMoneyHUD(localMoney, (1, 0, 0));
}

// Remove all Players HUD - Money
RemoveAllMoneyHud()
{
    for ( i = 0; i < level.players.size; i++ )
    {
        p = level.players[i];

        p.hud_money destroy();
        p.hud_money_extra destroy();
    }
}