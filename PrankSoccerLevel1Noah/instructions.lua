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

local muteButton
local unMuteButton

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local transitionSound = audio.loadStream("Sounds/jump.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/instructionsMusic.mp3")
local musicChannel = audio.play(music, {channel=3, loop = -1})

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Mute function to pause audio
local function Mute( touch )
    if (touch.phase == "ended") then
        audio.pause(musicChannel)
        soundOn = false
        muteButton.isVisible = false
        unMuteButton.isVisible = true
    end
end


-- Creating Mute function to pause audio
local function UnMute( touch )
    if (touch.phase == "ended") then
        audio.resume(musicChannel)
        soundOn = true
        muteButton.isVisible = true
        unMuteButton.isVisible = false
    end
end


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    

  if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
    end
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



    muteButton = display.newImageRect("Images/MuteButtonPressedNoah@2x.png", 100, 100)
    muteButton.x = 900
    muteButton.y = 620
    muteButton.isVisible = true

    unMuteButton = display.newImageRect("Images/MuteButtonUnpressedNoah@2x.png", 100, 100)
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
            width = 200,
            height = 100,
            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = MainMenuTransition          
        } )
        

       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
    sceneGroup:insert( backButton )

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
            audio.resume(musicChannel)
            unMuteButton.isVisible = false
            muteButton.isVisible = true
        else
            audio.pause(musicChannel)
            muteButton.isVisible = false
            unMuteButton.isVisible = true            
        end
        muteButton:addEventListener("touch", Mute)
        unMuteButton:addEventListener("touch", UnMute)

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
        muteButton:removeEventListener("touch", Mute)
        unMuteButton:removeEventListener("touch", UnMute)
        audio.pause(musicChannel)
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