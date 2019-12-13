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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local background
local backButton
local level1Text
local level3Text


-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local transitionSound = audio.loadStream("Sounds/jump.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/creditsMusic.mp3")
local musicChannel = audio.play(music, {channel=4, loop = -1})

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    

    transitionChannel = audio.play(transitionSound)
end    


local function Level1Transition( )
   composer.gotoScene( "level1_screen", {effect = "fade", time = 1000})
    audio.stop()
    
    transitionSoundChannel = audio.play(transitionSound)
end    

local function Level3Transition( )
   composer.gotoScene( "level3_screen", {effect = "fade", time = 1000})
    audio.stop()
    
    transitionSoundChannel = audio.play(transitionSound)
end    
-- fades in the buttons
local function ButtonFade( event )
    backButton.alpha = backButton.alpha + 0.006
    level1Button.alpha = level1Button.alpha + 0.006
    level3Button.alpha = level3Button.alpha + 0.006

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
    background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    background:setFillColor(255/255, 185/255, 104/255)
    

    sceneGroup:insert( background )

    level1Text = display.newText("Level 1", display.contentWidth/3 - 80 , display.contentHeight/2 - 150 , nil, 40 )
    sceneGroup:insert( level1Text )
    
    level3Text = display.newText("Level 3", display.contentWidth/1.5 + 80 , display.contentHeight/2 - 150 , nil, 40 )
    sceneGroup:insert( level3Text )

    
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Back Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 100,
            width = 200,
            height = 100,
            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = MainMenuTransition          
        } )
       
        backButton.alpha = 0

-- Creating level1  Button
    level1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/3 - 100,
            y = display.contentHeight/2,
            width = 400,
            height = 200,
            

            -- Insert the images here
            defaultFile = "Images/level1ScreenTestNoah@2x.png",
            overFile = "Images/level1ScreenTestNoah@2x.png",

            -- When the button is released, call the level1 screen transition function
            onRelease = Level1Transition          
        } )
       
        level1Button.alpha = 0

        -- Creating level3  Button
    level3Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.5 + 100,
            y = display.contentHeight/2,
            width = 400,
            height = 200,
            

            -- Insert the images here
            defaultFile = "Images/Level3ScreenNoah@2x.png",
            overFile = "Images/Level3ScreenNoah@2x.png",

            -- When the button is released, call the level1 screen transition function
            onRelease = Level3Transition          
        } )
       
        level3Button.alpha = 0

       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
    sceneGroup:insert( backButton )
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level3Button )

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
 Runtime:addEventListener("enterFrame", ButtonFade)
    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
       
        if (soundOn == true) then
            audio.resume(musicChannel)
           
        else
            audio.pause(musicChannel)
                       
        end
       

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