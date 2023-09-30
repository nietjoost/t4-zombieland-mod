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
GetCurrent()
{
    return self.menu["currentMenu"];
}

GetLocked()
{
    return self.menu["isLocked"];
}

GetUserIn()
{
    return self.playerSetting["isInMenu"];
}

GetCursor()
{
    return self.menu["curs"];
}