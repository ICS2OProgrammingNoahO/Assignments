-- Title: Assignment 3
-- Name: Noah Ouellette
-- Course: ICS2O/3C
-- This program...



	--hides the status bar
	display.setStatusBar(display.HiddenStatusBar)
-- set the background
local backgroundImage = display.newImageRect("Images/background.png", 1600, 800)

--set qoordinates of the background
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-------------------------------------------------------------------------------------------------------
--create the variables
-------------------------------------------------------------------------------------------------------

local galagaShip = display.newImageRect("Images/galaga.png", 100, 100)

galagaShip.rotation = 135
galagaShip.y = 1
galagaShip.x = 1
	scrollSpeed = 1


local curve = 1


local function Curve( event )
	curve = curve + 0.5
end


local function MoveShip(event)
		-- add the scroll speed to the y-value of the ship
		galagaShip.y =  galagaShip.y + 6
		galagaShip.x = galagaShip.x + curve
end
		
	


Runtime:addEventListener("enterFrame", MoveShip)

Runtime:addEventListener("enterFrame", Curve)
--y = x²


