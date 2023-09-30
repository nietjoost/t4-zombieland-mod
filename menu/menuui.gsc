#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

//UI utilities
CreateText(fontSize, sorts, text, align, relative, x, y, alpha, color)
{
    uiElement = self createfontstring("default", fontSize);
    uiElement setPoint(align, relative, x, y);
    uiElement settext(text);
    uiElement.sort = sorts;
    if( isDefined(alpha) )
    {
        uiElement.alpha = alpha;
    }
    if( isDefined(color) )
    {
        uiElement.color = color;
    }
    return uiElement;
}

CreateRectangle(align, relative, x, y, width, height, color, sort, alpha, shader)
{
    uiElement = newClientHudElem( self );
    uiElement.elemType = "bar";
    uiElement.width = width;
    uiElement.height = height;
    uiElement.align = align;
    uiElement.relative = relative;
    uiElement.xOffset = 0;
    uiElement.yOffset = 0;
    uiElement.children = [];
    uiElement.sort = sort;
    uiElement.color = color;
    uiElement.alpha = alpha;
    uiElement setParent( level.uiParent );
    uiElement setShader( shader, width , height );
    uiElement.hidden = false;
    uiElement setPoint(align,relative,x,y);
    return uiElement;
}

AffectElement(type, time, value)
{
    if( type == "x" || type == "y" )
        self moveOverTime( time );
    else
        self fadeOverTime( time );

    if( type == "x" )
        self.x = value;
    if( type == "y" )
        self.y = value;
    if( type == "alpha" )
        self.alpha = value;
    if( type == "color" )
        self.color = value;
}