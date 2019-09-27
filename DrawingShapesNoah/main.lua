-- Title: DrawingShapes
-- Name: Noah Ouellette
-- Course: ICS2O
-- This program Displays various shapes
-- 2019-09-26

--Creates a variable that has the verticies of the polygon

local pentagonVerticies = {-60, -120, -120, -60, -60, 60, 60, 60, 120, -60}

--display the polygon
local pentagon = display.newPolygon(200, 200, pentagonVerticies)

--Sets border width
pentagon.strokeWidth = 5
--sets border color
pentagon:setStrokeColor( 255/255, 0/255, 0/255)
--sets fill color
pentagon:setFillColor(0/255, 200/255, 0/255)

--creates the text
local pentagonText = display.newText("Pentagon", 200, 350, nil, 50)

pentagonText.strokeWidth = 5

pentagonText:setStrokeColor(1000/255, 0/255, 255/255)
