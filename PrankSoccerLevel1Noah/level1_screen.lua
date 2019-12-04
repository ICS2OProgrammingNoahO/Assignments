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
local music = audio.loadStream("Sounds/creditsMusic.mp3")
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


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( leftNet, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( rightNet, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( bottomBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( topBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( character, "dynamic", { density=1, friction=0.5, bounce=0.5, rotation=0 } )
    physics.addBody( rightBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( leftBorder,  "static", { density=1.0, friction=1, bounce=0 } )
   
end

local function RemovePhysicsBodies()
    
      physics.removeBody( leftNet )
      physics.removeBody( rightNet )
      physics.removeBody( character )
      physics.removeBody( bottomBorder )
      physics.removeBody( topBorder )
      physics.removeBody( rightBorder )
      physics.removeBody( leftBorder )
end

local function Rotate()
    character:rotate (15)
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

   leftNet = display.newImageRect("Images/net1.png",150, 150)
   leftNet.x = display.contentCenterX - 450
   leftNet.y = display.contentCenterY + 200

   rightNet = display.newImageRect("Images/net2.png",150, 150)
   rightNet.x = display.contentCenterX + 450
   rightNet.y = display.contentCenterY + 200

    sceneGroup:insert( leftNet )
    sceneGroup:insert( rightNet )

   bottomBorder = display.newRect(display.contentWidth/2, 708, display.contentWidth, 100)
   bottomBorder.alpha = 0

    sceneGroup:insert( bottomBorder )


  topBorder = display.newRect(display.contentWidth/2, -90, display.contentWidth, 100)

    sceneGroup:insert( topBorder )

  rightBorder = display.newRect(display.contentWidth, display.contentHeight/2, 100, display.contentHeight)

    sceneGroup:insert( rightBorder )
 
 leftBorder = display.newRect(0, display.contentHeight/2, 100, display.contentHeight)

    sceneGroup:insert( leftBorder )

   character = display.newImageRect("Images/CharacterNoah@2x.png",75, 125)
   character.x = display.contentCenterX
   character.y = display.contentCenterY

    sceneGroup:insert( character )

    -- prevent character from being able to tip over
   -- character.isFixedRotation = true


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
        Rotate()
        -- set gravity
        physics.setGravity( 0, GRAVITY )
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