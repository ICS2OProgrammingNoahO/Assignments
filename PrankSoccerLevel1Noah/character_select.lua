----------------------------------------------------------------------------------------
--
--  level_select.lua
-- Created by: Noah
-- Date: December 11th, 2019
-- Description: This is the level select screen, displaying the level & back buttons.
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
sceneName = "character_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- Global VARIABLES
-----------------------------------------------------------------------------------------

characterf = 1



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local background
local backButton
local character1Button
local character2Button


-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local transitionSound = audio.loadStream("Sounds/jump.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/creditsMusic.mp3")
local musicChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    
if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
   end
end    


local function Character1( )
    characterf = 1
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

local function Character2( )
    characterf = 2
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

local function Character3( )
    characterf = 3
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

-- fades in the buttons
local function ButtonFade( event )
    backButton.alpha = backButton.alpha + 0.006


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
    background = display.newImageRect("Images/CharacterScreenNoah@2x.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    

    sceneGroup:insert( background )

   

    
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Back Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 35,
            width = 150,
            height = 75,
          

            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = MainMenuTransition          
        } )
       
        backButton.alpha = 0
 -- Creating Back Button
    character1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 267,
            y = display.contentHeight - 440,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/character.png",
            overFile = "Images/characterRolling.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character1         
        } )
     


 -- Creating Back Button
    character2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 440,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/DinoCharacter.png",
            overFile = "Images/DinoCharacterJumping.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character2         
        } )
       



        
       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
    sceneGroup:insert( character2Button )
      sceneGroup:insert( character1Button )
        sceneGroup:insert( backButton )
    

    

end  



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
   

    -----------------------------------------------------------------------------------------

    local phase = event.phase
    physics.start()
    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       if (soundOn == true) then
            audio.play(musicChannel)

       
                       
        end
    -----------------------------------------------------------------------------------------
 Runtime:addEventListener("enterFrame", ButtonFade)
    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
       
        
       

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
        Runtime:removeEventListener( "enterFrame")
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    
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