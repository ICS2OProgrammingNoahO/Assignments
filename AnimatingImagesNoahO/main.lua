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
scrollSpeed = 0.5


local curve = 1
local curve2 = 1


local function Curve( event )
	curve = curve + 0.5
	timer.performWithDelay(1000, Curve)
end

local function Curve2( event )
	curve2 = curve2 + 0.5
	timer.performWithDelay(1000, Curve2)
end

local function MoveShip(event)
		-- add the scroll speed to the y-value of the ship
		galagaShip.y =  galagaShip.y + 8
		galagaShip.x = galagaShip.x + curve
		galagaShip:rotate(-1.2)
	
			
end

	
local function Loop( event )
	-- body
	if (galagaShip.x < 500) then
 	scrollSpeed = 1
 	 MoveShip()
	else
	scrollSpeed = 10
	galagaShip.y = galagaShip.y - 4
	galagaShip.x = galagaShip.x + curve2
	galagaShip:rotate (-1.2)

	end
end

Runtime:addEventListener("enterFrame", Loop)
Runtime:addEventListener("enterFrame", Curve)
Runtime:addEventListener("enterFrame", Curve2)

--y = x²


