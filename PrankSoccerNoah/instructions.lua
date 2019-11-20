----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
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

background = display.newImageRect("Images/InstructionsScreenNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY

      sceneGroup:insert( background )


return scene