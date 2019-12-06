----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen, displaying level 1
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local backButton
local channel
local music = audio.loadStream("Sounds/level1Music.mp3")
local channel2
local transitionSound = audio.loadStream("Sounds/jump.mp3")
local leftNet
local rightNet
local platform1
local bottomBorder
local topBorder
local rightBorder
local leftBorder
local character
local upButton
local verticalSpeed = 200
local numUp = 0
local platform1
local platform2
local platform3
local ball1
local goalie
local netBorder
local netBorder2
local netBorder3
local netBorder4
local characterRolling
local characterJumping



-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( netBorder2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder3, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder4, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( bottomBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( topBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( character, "dynamic", { density=1, friction=0.5, bounce=0.6, rotation=0 } )
    physics.addBody( rightBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( leftBorder,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform1,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform2,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform3,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.9, radius=25})
   
end

local function RemovePhysicsBodies()
    
      physics.removeBody( netBorder2 )
      physics.removeBody( netBorder )
      physics.removeBody( netBorder3 )
      physics.removeBody( netBorder4 )
      physics.removeBody( character )
      physics.removeBody( bottomBorder )
      physics.removeBody( topBorder )
      physics.removeBody( rightBorder )
      physics.removeBody( leftBorder )
      physics.removeBody( platform1 )
      physics.removeBody( platform2 )
      physics.removeBody( platform3 )
      physics.removeBody( ball1)
end


local function Change2( )
  characterJumping.isVisible = false
  character.isVisible = true
end
local function Change(  )
  characterJumping.isVisible = true
  character.isVisible = false
end
local function Character( event )
  characterJumping.x = character.x
  characterJumping.y = character.y
  characterJumping.rotation = character.rotation
end
  
local function Stop(  )
  numUp = 0
end


local function MoveCharacterUp()
Change()
timer.performWithDelay(500, Change2)
if (numUp == 5) then
  character.y = character.y
  timer.performWithDelay(500, Stop)

else
character:setLinearVelocity( 0, -verticalSpeed )
numUp = numUp + 1
end


end

local function MoveCharacterRight()
character:rotate (10)
character:setLinearVelocity( 120, 10 )
end

local function MoveCharacterLeft()
character:rotate (-10)
character:setLinearVelocity( -120, 10 )
end
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideRight", time = 1000})
    audio.stop()
    channel2 = audio.play(transitionSound)
end    
----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------   background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)

    background = display.newImageRect("Images/level1ScreenTestNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY

      sceneGroup:insert( background )

   

   bottomBorder = display.newRect(display.contentWidth/2, 708, display.contentWidth, 100)
   bottomBorder.alpha = 0

    sceneGroup:insert( bottomBorder )


  topBorder = display.newRect(display.contentWidth/2, -90, display.contentWidth, 100)
     topBorder.alpha = 0

    sceneGroup:insert( topBorder )

  rightBorder = display.newRect(display.contentWidth + 60, display.contentHeight/2, 100, display.contentHeight)
   rightBorder.alpha = 0

    sceneGroup:insert( rightBorder )
 
 leftBorder = display.newRect(-60, display.contentHeight/2, 100, display.contentHeight)
   leftBorder.alpha = 0

    sceneGroup:insert( leftBorder )

   character = display.newImageRect("Images/character.png",75, 125)
   character.x = display.contentCenterX
   character.y = display.contentCenterY

   character.isFixedRotation = true

    sceneGroup:insert( character )

    characterJumping = display.newImageRect("Images/characterRolling.png",75, 125)
    characterJumping.x = character.x
    characterJumping.y = character.y
    characterJumping.isVisible = false


  platform1 = display.newImageRect("Images/platform.png",200, 25)
   platform1.x = display.contentCenterX
   platform1.y = display.contentCenterY

    
    sceneGroup:insert( platform1 )

  platform2 = display.newImageRect("Images/platform.png",200, 25)
   platform2.x = display.contentCenterX + 300
   platform2.y = display.contentCenterY - 200

    
    sceneGroup:insert( platform2 )

  platform3 = display.newImageRect("Images/platform.png",200, 25)
   platform3.x = display.contentCenterX - 300
   platform3.y = display.contentCenterY - 200

    
    sceneGroup:insert( platform3 )

    
  ball1 = display.newImage("Images/BallNoah@2x.png",  display.contentCenterX + 300, 100)
  ball1.yScale = 0.125
  ball1.xScale = 0.125


    sceneGroup:insert( ball1 )

goalie = display.newImageRect("Images/OppositeTeamCharacterNoah@2x.png",75, 125)
   goalie.x = display.contentCenterX + 300
   goalie.y = display.contentCenterY + 200

   sceneGroup:insert( goalie)

netBorder = display.newRect(display.contentCenterX + 450,515,150,10)
 netBorder.alpha = 0

   sceneGroup:insert( netBorder)

netBorder2 = display.newRect(display.contentCenterX - 450,515,150,10)
 netBorder2.alpha = 0

   sceneGroup:insert( netBorder2)

netBorder3 = display.newRect(display.contentCenterX + 486,580,150,10)
 netBorder3.alpha = 0
netBorder3:rotate (62)
   sceneGroup:insert( netBorder3)

netBorder4 = display.newRect(display.contentCenterX - 486,580,150,10)
 netBorder4.alpha = 0
netBorder4:rotate (-62)
   sceneGroup:insert( netBorder4)


   leftNet = display.newImageRect("Images/net1.png",150, 150)
   leftNet.x = display.contentCenterX - 450
   leftNet.y = display.contentCenterY + 200

   rightNet = display.newImageRect("Images/net2.png",150, 150)
   rightNet.x = display.contentCenterX + 450
   rightNet.y = display.contentCenterY + 200

    sceneGroup:insert( leftNet )
    sceneGroup:insert( rightNet )

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 910,
            y = display.contentHeight - 710,
            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MainMenuTransition          
        } )
        backButton.width = 200
        backButton.height = 100

        sceneGroup:insert( backButton )


         upButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = 700,
            

            -- Insert the images here
            defaultFile = "Images/upButtonUnpressedNoah@2x.png",
            overFile = "Images/upButtonPressedNoah@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterUp          
        } )
        upButton.width = 100
        upButton.height = 100

        sceneGroup:insert( upButton )

          rightButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 + 300,
            y = 700,
            

            -- Insert the images here
            defaultFile = "Images/clockwiseButtonUnpressedNoah@2x.png",
            overFile = "Images/clockwiseButtonPressedNoah@2x - Copy.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterRight          
        } )
        rightButton.width = 100
        rightButton.height = 100

        sceneGroup:insert( rightButton )

          leftButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 300,
            y = 700,
            

            -- Insert the images here
            defaultFile = "Images/counterclockwiseButtonUnpressedNoah@2x - Copy.png",
            overFile = "Images/counterclockwiseButtonPressedNoah@2x - Copy - Copy.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterLeft         
        } )
        leftButton.width = 100
        leftButton.height = 100

        sceneGroup:insert( leftButton )
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
   



    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
       channel = audio.play(music, {loop = -1})

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
                -- start physics
        physics.start()
        --Rotate()
        -- set gravity
        physics.setGravity( 0, 20 )
        Runtime:addEventListener("enterFrame", Character)
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
           AddPhysicsBodies()
   
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        RemovePhysicsBodies()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
             --RemoveCollisionListeners()
        

        physics.stop()
       -- RemoveArrowEventListeners()
        --RemoveRuntimeListeners()
       
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )





return scene