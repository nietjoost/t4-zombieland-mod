// Calculate money text
GetMenuBuyText(cost)
{
    if (cost <= self.money)
    {
        return "  [^2$"+ cost + "^7]";
    }

    return "  [^1$"+ cost + "^7]";
}

//Not import functions
getCurrent()
{
    return self.menu["currentMenu"];
}

getLocked()
{
    return self.menu["isLocked"];
}

getUserIn()
{
    return self.playerSetting["isInMenu"];
}

getCursor()
{
    return self.menu["curs"];
}