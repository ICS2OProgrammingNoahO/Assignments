-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local logo = display.newImageRect("Images/CompanyLogoNoah@2x.png", 50, 50 )
logo.x = display.contentWidth/1
logo.y = display.contentHeight/1.2
logo:rotate (15)
local curve = 1


local function LogoSize( )
	logo.xScale = logo.xScale + 0.07
	logo.yScale = logo.yScale + 0.07
	timer.performWithDelay(1500, StopRotation)
end
local function Curve( event )
 curve = curve + 0.2
end
local function KickLogo( event )
	if (logo.x == display.contentWidth/2)then
	logo.x = display.contentWidth/2
	logo:rotate (5)
	LogoSize()
	
	else logo.x = logo.x - 8
	logo.y = logo.y - curve
	logo.xScale = logo.xScale + 0.06
	logo.yScale = logo.yScale + 0.06
	logo.rotation = logo.rotation + 3

end



end
local function KickLogoEveryFrame( )
		
			Runtime:addEventListener("enterFrame", KickLogo)
			Runtime:addEventListener("enterFrame", Curve)
		
end

local function KickLogoDelay( )
	timer.performWithDelay(2000, KickLogoEveryFrame)
end

		




KickLogoDelay()


