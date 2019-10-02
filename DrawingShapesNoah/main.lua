-- Title: DrawingShapes
-- Name: Noah Ouellette
-- Course: ICS2O
-- This program Displays various shapes
-- 2019-09-26
-------------------------------------------------------------------------------------------------------------------
--PENTAGON
-------------------------------------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

--Creates a variable that has the verticies of the polygon

local pentagonVerticies = {-60, -120, -120, -60, -60, 60, 60, 60, 120, -60}

--display the polygon
local pentagon = display.newPolygon(200, 200, pentagonVerticies)

--Sets border width
pentagon.strokeWidth = 5
--sets border color
pentagon:setStrokeColor( 255/255, 0/255, 0/255)
--sets fill color
pentagon:setFillColor(0/255, 255/255, 0/255)

--creates the text
local pentagonText = display.newText("Pentagon", 200, 350, nil, 50)

pentagonText.strokeWidth = 5

pentagonText:setStrokeColor(1000/255, 0/255, 255/255)

pentagon.isVisible = true
pentagonText.isVisible = true

-------------------------------------------------------------------------------------------------------------------
--TRIANGLE
-------------------------------------------------------------------------------------------------------------------
local triangleVerticies = {-120, 60, 180, -120, 60, 60}

--display the polygon
local triangle = display.newPolygon(550, 200, triangleVerticies)

--Sets border width
triangle.strokeWidth = 5
--sets border color
triangle:setStrokeColor( 134/255, 11/255, 172/255)
--sets fill color
triangle:setFillColor(216/255, 135/255, 240/255)

--creates the text
local triangleText = display.newText("Triangle", 525, 350, nil, 50)

triangleText.strokeWidth = 5

triangleText:setStrokeColor(1000/255, 0/255, 255/255)

triangle.isVisible = true
triangleText.isVisible = true


-------------------------------------------------------------------------------------------------------------------
--OCTAGON
-------------------------------------------------------------------------------------------------------------------
local octagonVerticies = {-60, 120, -120, 60, -120, -60, -60, -120, 60, -120, 120, -60, 120, 60, 60, 120}

--display the polygon
local octagon = display.newPolygon(550, 540, octagonVerticies)

--Sets border width
octagon.strokeWidth = 8
--sets border color
octagon:setStrokeColor( 255/255, 255/255, 255/255)
--sets fill color
octagon:setFillColor(255/255, 255/255, 0/255)

--creates the text
local octagonText = display.newText("Octagon", 550, 700, nil, 50)

octagonText.strokeWidth = 5

octagonText:setStrokeColor(1000/255, 0/255, 255/255)

octagon.isVisible = true
octagonText.isVisible = true

-------------------------------------------------------------------------------------------------------------------
--Quadrilateral
-------------------------------------------------------------------------------------------------------------------
local quadrilateralVerticies = {055, 123, 133, -122, -114, -024, -011, 115}

--display the polygon
local quadrilateral = display.newPolygon(200, 550, quadrilateralVerticies)

--Sets border width
quadrilateral.strokeWidth = 5
--sets border color
quadrilateral:setStrokeColor( 255/255, 255/255, 57/255)

--sets fill color
quadrilateral:setFillColor(25/255, 176/255, 240/255)

--creates the text
local quadrilateralText = display.newText("Quadrilateral", 200, 700, nil, 50)

quadrilateralText.strokeWidth = 5

quadrilateralText:setStrokeColor(127/255, 219/255, 178/255)

quadrilateral.isVisible = true
quadrilateralText.isVisible = true

-------------------------------------------------------------------------------------------------------------------
--title1
-------------------------------------------------------------------------------------------------------------------
local title1 = display.newText("Normal Coloured Shapes", display.contentWidth/2, 50, nil, 70)

title1:setFillColor(0/255, 0/255, 255/255)

title1.isVisible = true

-------------------------------------------------------------------------------------------------------------------
--title2
-------------------------------------------------------------------------------------------------------------------
local title2 = display.newText("Gradient Coloured Shapes", display.contentWidth/2, 50, nil, 70)

title2:setFillColor(0/255, 0/255, 255/255)

title2.isVisible = false


-------------------------------------------------------------------------------------------------------------------
--title3
-------------------------------------------------------------------------------------------------------------------
local title3 = display.newText("Image Filled Shapes", display.contentWidth/2, 50, nil, 70)

title3:setFillColor(0/255, 0/255, 255/255)

title3.isVisible = false
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------


--Creates a variable that has the verticies of the polygon

local pentagonGVerticies = {-60, -120, -120, -60, -60, 60, 60, 60, 120, -60}

--display the polygon
local pentagonG = display.newPolygon(350, 200, pentagonGVerticies)

--Sets border width
pentagonG.strokeWidth = 5
--sets border color
pentagonG:setStrokeColor( 255/255, 0/255, 0/255)

--creates gradient
local go4 = { type="gradient", color1={ 0/255, 255/255, 0/255 }, color2={ 0, 0, 255 } }
--sets fill color
pentagonG:setFillColor(go4)

--creates the text
local pentagonGText = display.newText("Pentagon", 350, 350, nil, 50)

pentagonGText.strokeWidth = 5

pentagonGText:setStrokeColor(1000/255, 0/255, 255/255)

pentagonG.isVisible = false
pentagonGText.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--TRIANGLE
-------------------------------------------------------------------------------------------------------------------
local triangleVerticiesG = {-120, 60, 180, -120, 60, 60}

--display the polygon
local triangleG = display.newPolygon(620, 200, triangleVerticiesG)

--Sets border width
triangleG.strokeWidth = 5
--sets border color
triangleG:setStrokeColor( 134/255, 11/255, 172/255)

--creates gradient
local go3 = { type="gradient", color1={ 216/255, 135/255, 240/255 }, color2={ 230/255, 0/255, 150/255 } }
--sets fill color
triangleG:setFillColor(go3)

--creates the text
local triangleGText = display.newText("Triangle", 595, 350, nil, 50)

triangleGText.strokeWidth = 5

triangleGText:setStrokeColor(100/255, 0/255, 255/255)

triangleG.isVisible = false
triangleGText.isVisible = false


-------------------------------------------------------------------------------------------------------------------
--OCTAGON
-------------------------------------------------------------------------------------------------------------------
local octagonVerticiesG = {-60, 120, -100, 60, -120, -60, -60, -100, 60, -120, 120, -60, 120, 60, 60, 120}

--display the polygon
local octagonG = display.newPolygon(620, 540, octagonVerticiesG)

--Sets border width
octagonG.strokeWidth = 8
--sets border color
octagonG:setStrokeColor( 255/255, 255/255, 255/255)

--creates gradient
local go2 = { type="gradient", color1={ 255/255, 255/255, 0/255 }, color2={ 255, 0, 0 } }
--sets fill color
octagonG:setFillColor(go2)

--creates the text
local octagonGText = display.newText("Octagon", 620, 700, nil, 50)

octagonGText.strokeWidth = 5

octagonGText:setStrokeColor(1000/255, 0/255, 255/255)

octagonG.isVisible = false
octagonGText.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--Quadrilateral
-------------------------------------------------------------------------------------------------------------------
local quadrilateralVerticiesG = {055, 103, 063, -032, -114, -024, -011, 115}

--display the polygon
local quadrilateralG = display.newPolygon(350, 550, quadrilateralVerticiesG)

--Sets border width
quadrilateralG.strokeWidth = 5
--sets border color
quadrilateralG:setStrokeColor( 255/255, 255/255, 57/255)

--creates gradient
local go1 = { type="gradient", color1={ 25/255, 176/255, 240/255 }, color2={ 230, 0, 255 } }
--sets fill color
quadrilateralG:setFillColor(go1)

--creates the text
local quadrilateralGText = display.newText("Quadrilateral", 350, 700, nil, 50)

quadrilateralGText.strokeWidth = 5

quadrilateralGText:setStrokeColor(127/255, 219/255, 178/255)

quadrilateralG.isVisible = false
quadrilateralGText.isVisible = false

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------


--Creates a variable that has the verticies of the polygon

local pentagonIVerticies = {-60, -120, -120, -60, -60, 60, 60, 60, 120, -60}

--display the polygon
local pentagonI = display.newPolygon(450, 200, pentagonIVerticies)

--Sets border width
pentagonI.strokeWidth = 5
--sets border color
pentagonI:setStrokeColor( 0/255, 0/255, 255/255)


--sets fill 
pentagonI.fill = { type="image", filename="Blue Sky.png" }

--creates the text
local pentagonIText = display.newText("Pentagon", 450, 350, nil, 50)

pentagonIText.strokeWidth = 5

pentagonIText:setStrokeColor(0/255, 0/255, 255/255)

pentagonI.isVisible = false
pentagonIText.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--TRIANGLE
-------------------------------------------------------------------------------------------------------------------
local triangleVerticiesI = {-120, 60, 180, -120, 60, 60}

--display the polygon
local triangleI = display.newPolygon(800, 200, triangleVerticiesI)

--Sets border width
triangleI.strokeWidth = 5
--sets border color
triangleI:setStrokeColor( 134/255, 11/255, 172/255)

--creates gradient
local go3 = { type="gradient", color1={ 216/255, 135/255, 240/255 }, color2={ 230/255, 0/255, 150/255 } }
--sets fill color
triangleI:setFillColor(go3)

--creates the text
local triangleIText = display.newText("Triangle", 775, 350, nil, 50)

triangleIText.strokeWidth = 5

triangleIText:setStrokeColor(100/255, 0/255, 255/255)

triangleI.isVisible = false
triangleIText.isVisible = false


-------------------------------------------------------------------------------------------------------------------
--OCTAGON
-------------------------------------------------------------------------------------------------------------------
local octagonVerticiesI = {-60, 120, -120, 60, -120, -60, -60, -120, 60, -120, 120, -60, 120, 60, 60, 120}

--display the polygon
local octagonI = display.newPolygon(800, 540, octagonVerticiesI)

--Sets border width
octagonI.strokeWidth = 8
--sets border color
octagonI:setStrokeColor( 255/255, 255/255, 255/255)

--creates gradient
local go2 = { type="gradient", color1={ 255/255, 255/255, 0/255 }, color2={ 255, 0, 0 } }
--sets fill color
octagonI:setFillColor(go2)

--creates the text
local octagonIText = display.newText("Octagon", 800, 700, nil, 50)

octagonIText.strokeWidth = 5

octagonIText:setStrokeColor(1000/255, 0/255, 255/255)

octagonI.isVisible = false
octagonIText.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--Quadrilateral
-------------------------------------------------------------------------------------------------------------------
local quadrilateralVerticiesI = {055, 123, 133, -122, -114, -024, -011, 115}

--display the polygon
local quadrilateralI = display.newPolygon(450, 550, quadrilateralVerticiesI)

--Sets border width
quadrilateralI.strokeWidth = 5
--sets border color
quadrilateralI:setStrokeColor( 255/255, 255/255, 57/255)

--creates gradient
local go1 = { type="gradient", color1={ 25/255, 176/255, 240/255 }, color2={ 230, 0, 255 } }
--sets fill color
quadrilateralI:setFillColor(go1)

--creates the text
local quadrilateralIText = display.newText("Quadrilateral", 450, 700, nil, 50)

quadrilateralIText.strokeWidth = 5

quadrilateralIText:setStrokeColor(127/255, 219/255, 178/255)

quadrilateralI.isVisible = false
quadrilateralIText.isVisible = false










-------------------------------------------------------------------------------------------------------------------
--Arrow2
-------------------------------------------------------------------------------------------------------------------
--create theverticies
local arrow2Verticies = {60, -20, -60, -20, -60, -40, -110, 0, -60, 40, -60, 20, 60, 20}
-- display the arrow
local arrow2 = display.newPolygon( 100, 600, arrow2Verticies )

arrow2.strokeWidth = 3

arrow2:setStrokeColor(0/255, 255/255, 0/255)

arrow2.isVisible = false



-------------------------------------------------------------------------------------------------------------------
--Arrow3
-------------------------------------------------------------------------------------------------------------------
--create theverticies
local arrow3Verticies = {-60, 20, 60, 20, 60, 40, 110, 0, 60, -40, 60, -20, -60, -20}
-- display the arrow
local arrow3 = display.newPolygon( 900, 600, arrow3Verticies )

arrow3.strokeWidth = 3

arrow3:setStrokeColor(0/255, 255/255, 0/255)

arrow3.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--Arrow4
-------------------------------------------------------------------------------------------------------------------
--create theverticies
local arrow4Verticies = {60, -20, -60, -20, -60, -40, -110, 0, -60, 40, -60, 20, 60, 20}
-- display the arrow
local arrow4 = display.newPolygon( 100, 600, arrow4Verticies )

arrow4.strokeWidth = 3

arrow4:setStrokeColor(0/255, 255/255, 0/255)

arrow4.isVisible = false

-------------------------------------------------------------------------------------------------------------------
--Arrow
-------------------------------------------------------------------------------------------------------------------
--create theverticies
local arrowVerticies = {-60, 20, 60, 20, 60, 40, 110, 0, 60, -40, 60, -20, -60, -20}
-- display the arrow
local arrow = display.newPolygon( 890, 600, arrowVerticies )

arrow.strokeWidth = 3

arrow:setStrokeColor(0/255, 255/255, 0/255)

arrow.isVisible = true

--make it work
local function Arrow1(touch)
	if (touch.phase == "began") then
	quadrilateral.isVisible = false
	octagon.isVisible = false
	triangle.isVisible = false
	pentagon.isVisible = false
	title1.isVisible = false
	quadrilateralText.isVisible = false
	octagonText.isVisible = false
	triangleText.isVisible = false
	pentagonText.isVisible = false
	arrow.isVisible = false
	title2.isVisible = true
	pentagonG.isVisible = true
	pentagonGText.isVisible = true
	triangleG.isVisible = true
	triangleGText.isVisible = true
	octagonG.isVisible = true
	octagonGText.isVisible = true
	quadrilateralG.isVisible = true
	quadrilateralGText.isVisible = true
	arrow2.isVisible = true
	arrow3.isVisible = true
	arrow4.isVisible = false
	title3.isVisible = false
	end
end
arrow:addEventListener("touch", Arrow1)

--make arrow2 work
local function Arrow2(touch)
	if (touch.phase == "began") then
	quadrilateral.isVisible = true
	octagon.isVisible = true
	triangle.isVisible = true
	pentagon.isVisible = true
	title1.isVisible = true
	quadrilateralText.isVisible = true
	octagonText.isVisible = true
	triangleText.isVisible = true
	pentagonText.isVisible = true
	arrow.isVisible = true
	title2.isVisible = false
	pentagonG.isVisible = false
	pentagonGText.isVisible = false
	triangleG.isVisible = false
	triangleGText.isVisible = false
	octagonG.isVisible = false
	octagonGText.isVisible = false
	quadrilateralG.isVisible = false
	quadrilateralGText.isVisible = false
	arrow2.isVisible = false
	arrow3.isVisible = false
	arrow4.isVisible = false
	title3.isVisible = false
	end
end
arrow2:addEventListener("touch", Arrow2)


--make arrow3 work
local function Arrow3(touch)
	if (touch.phase == "began") then
	quadrilateral.isVisible = false
	octagon.isVisible = false
	triangle.isVisible = false
	pentagon.isVisible = false
	title1.isVisible = false
	quadrilateralText.isVisible = false
	octagonText.isVisible = false
	triangleText.isVisible = false
	pentagonText.isVisible = false
	arrow.isVisible = false
	title2.isVisible = false
	pentagonG.isVisible = false
	pentagonGText.isVisible = false
	triangleG.isVisible = false
	triangleGText.isVisible = false
	octagonG.isVisible = false
	octagonGText.isVisible = false
	quadrilateralG.isVisible = false
	quadrilateralGText.isVisible = false
	arrow2.isVisible = false
	arrow3.isVisible = false
	pentagonI.isVisible = true
	pentagonIText.isVisible = true
	triangleI.isVisible = true
	triangleIText.isVisible = true
	octagonI.isVisible = true
	octagonIText.isVisible = true
	quadrilateralI.isVisible = true
	quadrilateralIText.isVisible = true
	arrow4.isVisible = true
	title3.isVisible = true
	end
end
arrow3:addEventListener("touch", Arrow3)

--make arrow4 work
local function Arrow4(touch)
	if (touch.phase == "began") then
	quadrilateral.isVisible = false
	octagon.isVisible = false
	triangle.isVisible = false
	pentagon.isVisible = false
	title1.isVisible = false
	quadrilateralText.isVisible = false
	octagonText.isVisible = false
	triangleText.isVisible = false
	pentagonText.isVisible = false
	arrow.isVisible = false
	title2.isVisible = true
	pentagonG.isVisible = true
	pentagonGText.isVisible = true
	triangleG.isVisible = true
	triangleGText.isVisible = true
	octagonG.isVisible = true
	octagonGText.isVisible = true
	quadrilateralG.isVisible = true
	quadrilateralGText.isVisible = true
	arrow2.isVisible = true
	arrow3.isVisible = true
	arrow4.isVisible = false
	pentagonI.isVisible = false
	pentagonIText.isVisible = false
	triangleI.isVisible = false
	triangleIText.isVisible = false
	octagonI.isVisible = false
	octagonIText.isVisible = false
	quadrilateralI.isVisible = false
	quadrilateralIText.isVisible = false
	title3.isVisible = false

	end
end
	arrow4:addEventListener("touch", Arrow4)