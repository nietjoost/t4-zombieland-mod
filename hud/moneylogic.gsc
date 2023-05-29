// MONEY logic
CreateMoneyHUD()
{
    self.hud_money = newClientHudElem(self);
    self.hud_money.alignX = "left";
    self.hud_money.alignY = "left";
    self.hud_money.x = 115;
    self.hud_money.y = 95;
    self.hud_money.font = "hudbig";
    self.hud_money.fontscale = 2.5;
    self.hud_scorePopup.archived = false;
    self.hud_money.color = (0, 1, 0);
    self.hud_money.hidewhendead = true;
    self.hud_money.hidewheninmenu = true;
    self.hud_money setText("$" + self.money);
}