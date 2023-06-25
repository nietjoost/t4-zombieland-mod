// Calculate money text
GetMenuBuyText(cost)
{
    if (cost <= self.money)
    {
        return "  [^2$"+ cost + "^7]";
    }

    return "  [^1$"+ cost + "^7]";
}

// Get the name witout clan
GetNameNotClan( player )
{
    for( a = 0; a < player.name.size; a++ )
    {
        if( player.name[a] == "[" )
            return getSubStr(player.name , 6, player.name.size);
        else
            return player.name;
    }
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