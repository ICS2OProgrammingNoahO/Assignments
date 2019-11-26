---------------------------------------------------------------------------------------------
-- splash_screen.lua
-- Created by:  Noah Ouellette
-- Date: November 11, 2019
-- Description: This is the animation of our company logo for Soccer GPA
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
local logo 
local logo2 
local logo3
local title
local man
local man2
local collisionSound = audio.loadSound("Sounds/jump.mp3")
local crowd = audio.loadSound("Sounds/cheer.mp3")
local channel1
local channel2
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

    display.setStatusBar(display.HiddenStatusBar)



-- fades logo, title and man at the end of the animation
local function Fade2( )
       logo3.alpha = logo3.alpha - 0.005
    title.alpha = title.alpha - 0.005
end

local function Fade( )
 Runtime:addEventListener("enterFrame", Fade2)
   
end

-- creates logo3 in center then calls fade
local function MoveLogo3( )
    logo3.isVisible = true
    logo3.x = display.contentWidth/2
    logo3.y = display.contentHeight/2
    timer.performWithDelay(500, Fade)
    

end

local function PlaySound2( )
    channel1 = audio.play(collisionSound)
    channel2 = audio.play(crowd)
    
end

--plays jump Sounds
local function PlaySound( )
    --channel1 = audio.play(collisionSound, {loop = 1})
    timer.performWithDelay(500, PlaySound2)
end
-- moves logo2 down from top after logo gets kicked off the screen
 local function MoveLogo2( )
    logo2.y = logo2.y + 4
     title.isVisible = true
      man2.alpha = man2.alpha - 0.008
      man2.rotation = man2.rotation + 10
     title.alpha = title.alpha +0.008
     if (logo2.y > display.contentHeight/2)then
        logo2.isVisible = false
        MoveLogo3()
     end
 end 

-- creates the parabolic curve that the logo travels on
local function Curve( event )
 curve = curve + 0.6
end

-- kicks logo off the screen
local function KickLogo( event )
    logo.x = logo.x - 7
    logo.y = logo.y - curve
    logo.xScale = logo.xScale + 0.08
    logo.yScale = logo.yScale + 0.08
    logo.rotation = logo.rotation + 3
    timer.performWithDelay(1200, MoveLogo2)
      
end


-- kicks logo every frame
local function KickLogoEveryFrame( )
        
            Runtime:addEventListener("enterFrame", KickLogo)
            Runtime:addEventListener("enterFrame", Curve)
            
        
end

-- moves man to kick the logo
local function MoveMan( )
    man.x = man.x - 5
    if ( man.x < display.contentWidth/1.2) then
       man.isVisible = false
       man2.isVisible = true
     
       
    end
    
end
-- delays the movement off the logo
local function KickLogoDelay( )
    Runtime:addEventListener("enterFrame", MoveMan)
    timer.performWithDelay(500, KickLogoEveryFrame)
end

-- The function that will go to the main menu 
local function gotoMainMenu( )       
   composer.gotoScene( "main_menu", {effect = "crossFade", time = 1000})
end 

--begins the code       
KickLogoDelay()

--plays Sounds
  PlaySound()
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
    --bkg:setFillColor(40/255, 203/255, 61/255)

    -- Display Logo
    logo = display.newImageRect("Images/CompanyLogoNoah@2x.png", 50, 50 )
    logo.x = display.contentWidth/1.2
    logo.y = display.contentHeight/1.2
    logo:rotate (255)

    -- Display logo2

    logo2 = display.newImageRect("Images/CompanyLogoNoah@2x.png", 500, 500 )
    logo2.x = display.contentWidth/2
    logo2.y = display.contentHeight - display.contentHeight - 250

    -- Display logo3
    logo3 = display.newImageRect("Images/CompanyLogoNoah@2x.png", 500, 500 )
    logo3.isVisible = false

    -- Display title
    title = display.newText("Soccer GPA", display.contentWidth/2, 700, nil, 80)
    title.isVisible = false
    title:setFillColor(0/255, 0/255, 0/255)
    title.alpha = 0

    -- Display Man
    man = display.newRect(display.contentWidth, display.contentHeight/1.2, 50, 50)
    man:setFillColor(0/255, 0/255, 0/255)
    man.strokeWidth = 10
    man:setStrokeColor(255/255, 0/255, 0/255)

    -- Display man2
    man2 = display.newRect(display.contentWidth, display.contentHeight/1.2, 50, 50)
    man2:setFillColor(0/255, 0/255, 0/255)
    man2.isVisible = false
    man2.x = display.contentWidth/1.2
    man2.y = display.contentHeight/1.2
    man2.strokeWidth = 10
    man2:setStrokeColor(255/255, 0/255, 0/255)

    -----------------------------------------------------------------------------------------     

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )
    sceneGroup:insert( logo )
    sceneGroup:insert( logo2 )
    sceneGroup:insert( logo3 )
    sceneGroup:insert( title )
    sceneGroup:insert( man )
    sceneGroup:insert( man2 )
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
         timer.performWithDelay ( 5500, gotoMainMenu)  
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
        Runtime:removeEventListener("enterFrame", Curve)
        Runtime:removeEventListener("enterFrame", MoveMan)
        Runtime:removeEventListener("enterFrame", KickLogo)
        Runtime:removeEventListener("enterFrame", Fade2)

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