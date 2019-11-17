-- main.lua
-- Created by:  Noah Ouellette
-- Date: November 11, 2019
-- Description: This calls the splash screen scene and hides the status bar
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Calling composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Tansitioning to the menu screen
composer.gotoScene( "splash_screen" )