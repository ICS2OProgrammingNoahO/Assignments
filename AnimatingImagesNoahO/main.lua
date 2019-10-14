-- Title: Assignment 3
-- Name: Noah Ouellette
-- Course: ICS2O/3C
-- This program moves different images in different directions
-- Date:9/14/19



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

local galagaShip
local curve = 1
local curve2 = 1
local curve3 = 1
local mario
local physics
local left_wall
local right_wall
local top_wall
local bottom_wall
local mushroom
local digdug
local fireFlower
local title2
local title
local invader
local _W = display.contentWidth
local _H = display.contentHeight
local alien
physics = require("physics")
physics.start()
physics.setGravity(0,0) --To make everything float, zero gravity


-------------------------------------------------------------------------------------------------------
--Functions
-------------------------------------------------------------------------------------------------------







-- creates the curve
local function Curve( event )
	curve = curve + 0.5
	timer.performWithDelay(1000, Curve)
end
-- creates the secondvcurve
local function Curve2( event )
	curve2 = curve2 + 0.15
	timer.performWithDelay(1000, Curve2)
end
-- creates the 3rd curve 
local function Curve3( event )
	curve3 = curve3 - 0.05
	timer.performWithDelay(1000, Curve3)
end
--moves the ship in a parabolic curve
local function MoveShip(event)
		-- add the scroll speed to the y-value of the ship
		galagaShip.y =  galagaShip.y + 8
		galagaShip.x = galagaShip.x + curve
		scrollSpeed = scrollSpeed - 0.7
		galagaShip:rotate(-1.2)			
end
--moves digdug in a parabolic curve
local function MoveDug(event)
		-- add the scroll speed to the y-value of the ship
		digdug.x =  digdug.x - 5
		digdug.y = digdug.y + curve3
		scrollSpeed = scrollSpeed - 0.7
		digdug:rotate(4)
			
end
--changes the direction of the ship
local function Loop( event )
	-- body
	if (galagaShip.x < 500) then
 	scrollSpeed = 1
 	 MoveShip()
	else
	scrollSpeed = 6
	galagaShip.y = galagaShip.y - 8
	galagaShip.x = galagaShip.x + curve2
	galagaShip:rotate (-1.2)

	end
end
--moves the space invader in a diagonal direction
local function MoveInvader( event )
	invader.x =invader.x + 2.2
	invader.y =invader.y + 1.5
	invader.alpha = invader.alpha + 0.005
	invader.xScale = invader.xScale - 0.002
	invader.yScale = invader.yScale - 0.002
end



--makes mario invisible
local function marioInvisable( event )
	mario.isVisible = false
	
end

--makes mario visible
local function marioVisable( event )
	mario.isVisible = true
	
end


--Changes marios size
	local function SizeMario(event)
		-- add the scroll speed to the y-value of the ship
		mario.xScale = mario.xScale+0.02
		mario.yScale = mario.yScale+0.02
	end

--moves mario
local function Movemario( event )
	mario.x = mario.x + 1
	if (mario.x == 800)then
		mario.x = 800
	end
end

--moves mushroom
local function MoveMushroom( event )
	mushroom.x = mushroom.x - 1
end
--allows mario to interact with the mushroom
local function Mushroom ( event )
	if (mario.x == display.contentWidth/2) then
	mushroom.isVisible = false
	mario.contentWidth = 400
	mario.contentHeight = 400
	timer.performWithDelay(500, marioInvisable)
	if (mario.isVisible == false) then
		timer.performWithDelay(500, marioVisable)
		timer.performWithDelay(500, marioInvisable)
		timer.performWithDelay(500, marioVisable)
		SizeMario()
	end
	if (mario.x == 900) then
		mario.x = 900
	else
		timer.performWithDelay(2000, Movemario)
	end
	
	else
	Movemario()

	end
	
end



-------------------------------------------------------------------------------------------------------
--Object Creation
-------------------------------------------------------------------------------------------------------
--creates the invisable box surrounding the title that the other objects bounce off of
titleBox = display.newRect(0, 0, 265, 70)
titleBox.x = display.contentWidth/2
titleBox.y = display.contentHeight/4
titleBox.alpha = 0

--creates the sub title
title2 =display.newText("THE GREAT", 400, 100, nil, 30)
title2.x = display.contentWidth/2
title2.y = display.contentHeight/6
title2:setFillColor(235/255, 124/255, 232/255)


--creates the title
title = display.newText("GAME", 400, 100, nil, 100)
title.x = display.contentWidth/2
title.y = display.contentHeight/4
title:setFillColor(179/255, 0/255, 255/255)

--creates the invader
invader = display.newImageRect("Images/invader.png", 70, 70)
invader.x = 0
invader.y = 0
invader.alpha = 0


--creates galagaship
galagaShip = display.newImageRect("Images/galaga.png", 100, 100)

galagaShip.rotation = 135
galagaShip.y = 1
galagaShip.x = 1
scrollSpeed = 0.5


--creates digdug
digdug = display.newImageRect("Images/digdug.png", 100, 100)
digdug.x = display.contentWidth - 100
digdug.y = display.contentHeight - 100


--creates mario
mario = display.newImageRect("Images/mario.png", 100, 100)

mario.y = 690


--creates alien and sets its linear velocity
alien = display.newImageRect("Images/galagaEnemy.png", 80, 80)
alien.x = math.random(100,_W-100)
alien.y = math.random(100,_H-100),
physics.addBody(alien,"dynamic",{bounce = 1, friction = 0})
alien:setLinearVelocity(300,300)
physics.addBody(titleBox, "static")
--physics.addBody(digdug, "dynamic", {bounce = 1, friction = 0})

--adds walls for object to bounce off of --- https://stackoverflow.com/questions/17766773/how-to-make-multiple-objects-bounce-around-in-corona-sdk
left_wall = display.newRect(0,0,1,2000)
physics.addBody(left_wall,"static")

right_wall = display.newRect(_W-1,0,1,2000)
physics.addBody(right_wall,"static")

top_wall = display.newRect(0,0,10000,2)
physics.addBody(top_wall,"static")

bottom_wall = display.newRect(0,_H,10000,500)
bottom_wall.alpha = 0
physics.addBody(bottom_wall,"static")

--creates fireFlower and sets its linear velocity
fireFlower = display.newImageRect("Images/fireFlower.png", 80, 80)
fireFlower.x = math.random(100,_W-100)
fireFlower.y = math.random(100,_H-100),
physics.addBody(fireFlower,"dynamic",{bounce = 1, friction = 0})
fireFlower:setLinearVelocity(300,300)
physics.addBody(titleBox, "static")
physics.addBody(invader, "static")

--creates the mushroom

mushroom = display.newImageRect("Images/mushroom.png", 80, 80)
mushroom.y = 690
mushroom.x = display.contentWidth
mushroom.isVisible = true

--creates the pipe

pipe = display.newImageRect("Images/marioPipe.png", 150, 150)
pipe.rotation = 270
pipe.x = display.contentWidth - 50
pipe.y = display.contentHeight- 90
-------------------------------------------------------------------------------------------------------
--call functions and event listeners
-------------------------------------------------------------------------------------------------------


Runtime:addEventListener("enterFrame", MoveMushroom)
Runtime:addEventListener("enterFrame", Loop)
Runtime:addEventListener("enterFrame", Curve)
Runtime:addEventListener("enterFrame", Curve2)
Runtime:addEventListener("enterFrame", Curve3)
Runtime:addEventListener("enterFrame", Mushroom)
Runtime:addEventListener("enterFrame", MoveDug)
Runtime:addEventListener("enterFrame", MoveInvader)





