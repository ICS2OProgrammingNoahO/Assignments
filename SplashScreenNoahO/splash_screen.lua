---------------------------------------------------------------------------------------------
-- you_lose.lua
-- Created by: Gil Robern
-- Modified by: Noah Ouellette
-- Date: October 28, 2019
-- Description: This shows the player that they lost the game and plays a booing sound.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg
local curve = 1
local logo = display.newImageRect("Images/CompanyLogoNoah@2x.png", 50, 50 )
local logo2 = display.newImageRect("Images/CompanyLogoNoah@2x.png", 500, 500 )
local logo3 = display.newImageRect("Images/CompanyLogoNoah@2x.png", 500, 500 )
local title = display.newText("Soccer GPA", display.contentWidth/2, 700, nil, 50)

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
    display.setStatusBar(display.HiddenStatusBar)
-- Your code here
local function Fade( )
    logo3.alpha = logo3.alpha - 0.01
    title.alpha = title.alpha - 0.01
end


local function MoveLogo3( )
    logo3.isVisible = true
    logo3.x = display.contentWidth/2
    logo3.y = display.contentHeight/2
   
    Runtime:addEventListener("enterFrame", Fade)
    

end


 local function MoveLogo2( )
    logo2.y = logo2.y + 2
     title.isVisible = true
     if (logo2.y == display.contentHeight/2)then
        logo2.isVisible = false
        MoveLogo3()
     end
 end 


local function Curve( event )
 curve = curve + 0.6
end

local function KickLogo( event )
    logo.x = logo.x - 7
    logo.y = logo.y - curve
    logo.xScale = logo.xScale + 0.08
    logo.yScale = logo.yScale + 0.08
    logo.rotation = logo.rotation + 3
    timer.performWithDelay(1200, MoveLogo2)
   

   
end



local function KickLogoEveryFrame( )
        
            Runtime:addEventListener("enterFrame", KickLogo)
            Runtime:addEventListener("enterFrame", Curve)
            
        
end


local function KickLogoDelay( )
    timer.performWithDelay(500, KickLogoEveryFrame)
end

        

logo.x = display.contentWidth/1.2
logo.y = display.contentHeight/1.2
logo:rotate (255)
logo2.x = display.contentWidth/2
logo2.y = display.contentHeight - display.contentHeight - 250
logo3.isVisible = false
title.isVisible = false
title:setFillColor(0/255, 0/255, 0/255)


KickLogoDelay()
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    bkg = display.newRect(200, 200, 200, 200)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight

    
    -----------------------------------------------------------------------------------------     

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )
    --sceneGroup:insert( logo )
end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end

end

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
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene



-----------------------------------------------------------------------------------------