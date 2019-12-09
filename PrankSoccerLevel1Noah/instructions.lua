----------------------------------------------------------------------------------------
--
--  instructions.lua
-- Created by: Noah
-- Date: November 20th, 2019
-- Description: This is the instructions screen, displaying the instructions & back buttons.
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "instructions"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------



local background
local backButton
local channel
local channel2
local muteButton
local unMuteButton
local transitionSound = audio.loadStream("Sounds/jump.mp3")
local music = audio.loadStream("Sounds/instructionsMusic.mp3")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Mute function to pause audio
local function Mute2( touch )
    if (touch.phase == "ended") then
        audio.pause(channel)
        soundOn = false
        muteButton.isVisible = false
        unMuteButton.isVisible = true
    end
end


-- Creating Mute function to pause audio
local function UnMute3( touch )
    if (touch.phase == "ended") then
        audio.resume(channel)
        soundOn = true
        muteButton.isVisible = true
        unMuteButton.isVisible = false
    end
end


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    

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
    -----------------------------------------------------------------------------------------
  -- creating the background
   background = display.newImageRect("Images/InstructionsScreenNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY

      sceneGroup:insert( background )



    muteButton = display.newImageRect("Images/MuteButtonUnpressedNoah@2x.png", 100, 100)
    muteButton.x = 900
    muteButton.y = 620
    muteButton.isVisible = true

      unMuteButton = display.newImageRect("Images/MuteButtonPressedNoah@2x.png", 100, 100)
    unMuteButton.x = 900
    unMuteButton.y = 620
    unMuteButton.isVisible = false
    

    sceneGroup:insert( muteButton )
    sceneGroup:insert( unMuteButton )
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 910,
            y = display.contentHeight - 70,
            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MainMenuTransition          
        } )
        backButton.width = 200
        backButton.height = 100

       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
 sceneGroup:insert( backButton )

    -- Send the background image to the back layer so all other objects can be on top
  
    background:toBack()


end  



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
   

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
         if (soundOn == true) then
            channel = audio.play(music, {loop = -1})
            unMuteButton.isVisible = false
            muteButton.isVisible = true
        elseif(soundOn == false) then
            muteButton.isVisible = false
            unMuteButton.isVisible = true
            end
        muteButton:addEventListener("touch", Mute2)
        unMuteButton:addEventListener("touch", UnMute3)

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute2)
        unMuteButton:removeEventListener("touch", UnMute3)
        audio.stop(channel)
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