-- Title: DrawingShapes
-- Name: Noah Ouellette
-- Course: ICS2O
-- This program Displays various shapes
-- 2019-09-26
-------------------------------------------------------------------------------------------------------------------
--PENTAGON
-------------------------------------------------------------------------------------------------------------------
--Creates a variable that has the verticies of the polygon

local pentagonVerticies = {-60, -120, -120, -60, -60, 60, 60, 60, 120, -60}

--display the polygon
local pentagon = display.newPolygon(200, 200, pentagonVerticies)

--Sets border width
pentagon.strokeWidth = 5
--sets border color
pentagon:setStrokeColor( 255/255, 0/255, 0/255)
--sets fill color
pentagon:setFillColor(0/255, 250/255, 0/255)

--creates the text
local pentagonText = display.newText("Pentagon", 200, 350, nil, 50)

pentagonText.strokeWidth = 5

pentagonText:setStrokeColor(1000/255, 0/255, 255/255)

-------------------------------------------------------------------------------------------------------------------
--TRIANGLE
-------------------------------------------------------------------------------------------------------------------
local triangleVerticies = {-120, 60, 180, -120, 60, 60}

--display the polygon
local triangle = display.newPolygon(500, 200, triangleVerticies)

--Sets border width
triangle.strokeWidth = 5
--sets border color
triangle:setStrokeColor( 255/255, 0/255, 0/255)
--sets fill color
triangle:setFillColor(0/255, 250/255, 0/255)

--creates the text
local triangleText = display.newText("Triangle", 445, 350, nil, 50)

triangleText.strokeWidth = 5

triangleText:setStrokeColor(0/255, 0/255, 255/255)

-------------------------------------------------------------------------------------------------------------------
--OCTAGON
-------------------------------------------------------------------------------------------------------------------
local octagonVerticies = {-60, 120, -120, 60, -120, -60, -60, -120, 60, -120, 120, -60, 120, 60, 60, 120}

--display the polygon
local octagon = display.newPolygon(800, 200, octagonVerticies)


--Sets border width
octagon.strokeWidth = 5
--sets border color
octagon:setStrokeColor(255/255, 0/255, 0/255)
--sets fill color
octagon:setFillColor(0/255, 255/255, 0/255)

--creates the text
local octagonText = display.newText("Octagon", 800, 350, nil, 50)

octagonText.strokeWidth = 5

octagonText:setStrokeColor(0/255, 0/255, 255/255)
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
local octagonVerticies = {-130, 90, -120, 60, -120, -60, -60, -90, 60, -120, 160, -60, 10, 60, 80, 120}

--display the polygon
local octagon = display.newPolygon(200, 550, octagonVerticies)


--Sets border width
octagon.strokeWidth = 5
--sets border color
octagon:setStrokeColor(0/255, 0/255, 255/255)
--sets fill color
octagon:setFillColor(230/255, 250/255, 0/255)

--creates the text
local octagonText = display.newText("Octagon", 800, 350, nil, 50)

octagonText.strokeWidth = 5

octagonText:setStrokeColor(0/255, 0/255, 255/255)
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------