// MONEY logic
CreateMoneyHUD()
{
    self.hud_money destroy();

    self.hud_money = newClientHudElem(self);
    self.hud_money.alignX = "left";
    self.hud_money.alignY = "left";
    self.hud_money.x = 20;
    self.hud_money.y = 95;
    self.hud_money.font = "hudbig";
    self.hud_money.fontscale = 2.5;
    self.hud_scorePopup.archived = false;
    self.hud_money.color = (0, 1, 0);
    self.hud_money.hidewhendead = true;
    self.hud_money.hidewheninmenu = true;
    self.hud_money setText("$" + self.money);

    if (self.type == "zombie")
    {
        self.hud_money.color = (1, 0, 0);
    }
}

// MONEY animation
AnimateMoneyHUD(localMoney, color)
{
    self.hud_money_extra destroy();

    self.hud_money_extra = newClientHudElem(self);
    self.hud_money_extra.alignX = "left";
    self.hud_money_extra.alignY = "left";
    self.hud_money_extra.x = 20;
    self.hud_money_extra.y = 95;
    self.hud_money_extra.font = "hudbig";
    self.hud_money_extra.fontscale = 2.5;
    self.hud_money_extra.color = color;
    self.hud_money_extra setText("$" + localMoney);
    self.hud_money_extra.hidewhendead = true;
    self.hud_money_extra.hidewheninmenu = true;
    self.hud_money_extra moveOverTime(2);
    self.hud_money_extra fadeOverTime(2);
    self.hud_money_extra.x = 150;
    self.hud_money_extra.y = 150;

    wait 1.5;

    self.hud_money_extra destroy();
}

// ADD money
AddMoney(localMoney)
{
    self.money = self.money + localMoney;
    self thread CreateMoneyHUD();
    self thread AnimateMoneyHUD(localMoney, (0, 1, 0));
}

// REMOVE money
RemoveMoney(localMoney)
{
    self.money = self.money - localMoney;
    self.hud_money setText("$" + self.money);
    self thread AnimateMoneyHUD(localMoney, (1, 0, 0));
}