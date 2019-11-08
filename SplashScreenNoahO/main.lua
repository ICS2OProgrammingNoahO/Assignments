-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
	display.setStatusBar(display.HiddenStatusBar)
-- Your code here
local logo = display.newImageRect("Images/CompanyLogoNoah@2x.png", 50, 50 )

local curve = 1



local function LogoSize( )
	--logo.xScale = logo.xScale + 0.07
	--logo.yScale = logo.yScale + 0.07
	logo.rotation = 0
	logo.x = display.contentWidth/2
	logo.y = display.contentHeight/2
	logo:rotate (5)
	
end
local function LogoSize2( event )
	Runtime:addEventListener("enterFrame", LogoSize)
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
	timer.performWithDelay(500, LogoSize2)





end


local function KickLogoEveryFrame( )
		
			Runtime:addEventListener("enterFrame", KickLogo)
			Runtime:addEventListener("enterFrame", Curve)
		
end


local function KickLogoDelay( )
	timer.performWithDelay(2000, KickLogoEveryFrame)
end

		

logo.x = 800
logo.y = display.contentHeight/1.2
logo:rotate (255)


KickLogoDelay()


