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
}

// MONEY animation
AnimateMoneyHUD(localMoney, color)
{
    if (self.moneyHudArrayCount == 5)
    {
        self.moneyHudArray[0] Destroy();
        self.moneyHudArray[1] Destroy();
        self.moneyHudArray[2] Destroy();
        self.moneyHudArray[3] Destroy();
        self.moneyHudArray[4] Destroy();
        self.moneyHudArrayCount = 0;
    }

    self.moneyHudArray[self.moneyHudArrayCount] = newClientHudElem(self);
    self.moneyHudArray[self.moneyHudArrayCount].alignX = "left";
    self.moneyHudArray[self.moneyHudArrayCount].alignY = "left";
    self.moneyHudArray[self.moneyHudArrayCount].x = 10;
    self.moneyHudArray[self.moneyHudArrayCount].y = 190;
    self.moneyHudArray[self.moneyHudArrayCount].font = "objective";
    self.moneyHudArray[self.moneyHudArrayCount].fontscale = 2.3;
    self.moneyHudArray[self.moneyHudArrayCount].color = color;
    self.moneyHudArray[self.moneyHudArrayCount] SetText("$" + localMoney);
    self.moneyHudArray[self.moneyHudArrayCount].hidewhendead = true;
    self.moneyHudArray[self.moneyHudArrayCount].hidewheninmenu = true;
    self.moneyHudArray[self.moneyHudArrayCount] MoveOverTime(2);
    self.moneyHudArray[self.moneyHudArrayCount] FadeOverTime(2);
    self.moneyHudArray[self.moneyHudArrayCount].x = RandomIntRange(130, 170);
    self.moneyHudArray[self.moneyHudArrayCount].y = RandomIntRange(190, 260);

    level thread DestroyAnimationHUD(self.moneyHudArray[self.moneyHudArrayCount]);

    self.moneyHudArrayCount++;
}

DestroyAnimationHUD(hud)
{
    wait 1.5;
    hud Destroy();
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