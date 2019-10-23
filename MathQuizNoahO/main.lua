-- Title: NumericTextFields
-- Name: Noah Ouellette
-- Course: ICS2O/3C
-- This program creates random addition problems that displays correct if the user answers correctly and displays incorrect if they are incorrect. This repats infinitely
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--hides the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background color
background = display.newImageRect("Images/background.jpeg", display.contentWidth, display.contentHeight)
background.y = display.contentHeight/2
background.x = display.contentWidth/2


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local points = 0
local points_ = 0
local youLose
local youWin
local correctAnswer1
local lives = 4
local livesText
local realAnswer
local rightSound = audio.loadSound( "Sounds/saber.mp3")
local wrongSound = audio.loadSound( "Sounds/blaster.mp3")
local gameOverSound = audio.loadSound( "Sounds/r2d2.mp3")
local channel1
local channel2
local channel3
local totalSeconds = 10
local secondsLeft = 10
local countDownTimer
local heart1
local heart2
local heart3
local heart4
local clockText
local clockObject
local bottomBorder
local stroke = 3
local speeder




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function AskQuestion()
	--generate a random number between 1 and 4 and declare it's variable
	randomOperator = math.random(1, 7)

	--generate 2 random numbers between a max. a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)
	randomNumber3 = math.random(2, 12)
	randomNumber4 = math.random(2, 12)
	--randomNumber5 = math.random(1, 4)
	--randomNumber6 = math.random(1, 4)
	
 
	if (randomOperator == 1) then

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
	elseif (randomOperator == 2) then
		
	correctAnswer = randomNumber1 - randomNumber2
		if (correctAnswer < 0) then
			correctAnswer = randomNumber2 - randomNumber1

		else 
			questionObject.text = randomNumber1 .. "-" .. randomNumber2 .. "="
		end
	--create question in text object
	elseif (randomOperator == 3) then
		
	correctAnswer = randomNumber1 * randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. "*" .. randomNumber2 .. "="

	elseif (randomOperator == 4) then
	
	correctAnswer1 = randomNumber4 * randomNumber3
	correctAnswer = correctAnswer1 / randomNumber3

	--create question in text object
	questionObject.text = correctAnswer1 .. "/" .. randomNumber3 .. "="


	end
end



local function 	UpdateTime()
	-- decrement the number of secondsLeft
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		livesText.text = "Lives = " .. lives
		AskQuestion()
		
				

		--*** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE\
		if (lives == 3) then
					
			heart1.isVisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart3.isVisible = false
		elseif (lives == 0) then
			heart4.isVisible = false
			youLose.isVisible = true
			incorrectObject.isVisible = false
			questionObject.isVisible = false
			numericfield.isVisible = false
			pointsText.isVisible = false
			livesText.isVisible = false
			channel2 = audio.play(wrongSound)
			timer.cancel(countDownTimer)
			clockText.isVisible = false
			
			
		end

	end

end

-- function that calls the timer
local function StartTimer()
	--create a countDown timer that loops infinitly
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end







function HideCorrect()

	correctObject.isVisible = false
	incorrectObject.isVisible = false
	realAnswer.isVisible = false
	

end 

local function NumericFeildListener( event )
	-- User begins editing "numericfield"
	if ( event.phase == "began") then

		--clear text numericField
		event.target.text = ""

	elseif (event.phase == "submitted") then

		--when the answer is submitted (enter key pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(700, HideCorrect)
			channel1 = audio.play(rightSound)
			secondsLeft = 10
			AskQuestion()
			
			

		--if the users answer and the correct answer are different:
		--give points
		points = points +1
		
		-- update it in display object
		pointsText.text = "Points = " .. points
		
		if (points == 5) then
				youWin.isVisible = true
				correctObject.isVisible = false
				questionObject.isVisible = false
				numericfield.isVisible = false
				pointsText.isVisible = false
				livesText.isVisible = false
				timer.cancel(countDownTimer)
				clockText.isVisible = false
				
			end
		

		else incorrectObject.isVisible = true
			realAnswer.text = "The real answer is " .. correctAnswer
			realAnswer.isVisible = true
			timer.performWithDelay(700, HideCorrect)
			channel2 = audio.play(wrongSound)
			points_ = points_ + 1
			 lives = lives - 1
			 secondsLeft = 10
			 AskQuestion()

			-- update it in display object
				livesText.text = "Lives = " .. lives

			if (lives == 3) then
					
			heart1.isVisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart3.isVisible = false
		elseif (lives == 0) then
			heart4.isVisible = false
			youLose.isVisible = true
			incorrectObject.isVisible = false
			questionObject.isVisible = false
			numericfield.isVisible = false
			pointsText.isVisible = false
			livesText.isVisible = false
			timer.cancel(countDownTimer)
			clockText.isVisible = false
			channel3 = audio.play(gameOverSound)
				
				
			end


		end
		--clear text numericField
		event.target.text = ""
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bottomBorder = display.newRect(500 , 730 , display.contentWidth + 100, 120)
bottomBorder:setFillColor(148/255, 148/255, 148/255)
bottomBorder.strokeWidth = 3
bottomBorder:setStrokeColor(1, 1, 1)
--create the hearts
heart1 = display.newImageRect("Images/lifeImage.png", 100, 100)
heart1.x = display.contentWidth * 6 / 8
heart1.y = display.contentHeight - 50

heart2 = display.newImageRect("Images/lifeImage.png", 100, 100)
heart2.x = display.contentWidth * 5 / 8
heart2.y = display.contentHeight - 50

heart3 = display.newImageRect("Images/lifeImage.png", 100, 100)
heart3.x = display.contentWidth * 4 / 8
heart3.y = display.contentHeight - 50

heart4 = display.newImageRect("Images/lifeImage.png", 100, 100)
heart4.x = display.contentWidth * 3 / 8
heart4.y = display.contentHeight - 50


realAnswer = display.newText("", display.contentWidth/2, display.contentHeight/9, nil, 50)

--displays a question and sets the color
--questionObject = display.newText( "", display.contentWidth/2, display.contentHeight/2, nil, 50 )
questionObject = display.newText( "", display.contentWidth*1/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(177/255, 20/255, 255/255)


--create the correct text object and make it invisable
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false


--create the incorrect text object and make it invisable
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(155/255, 42/255, 198/255)
incorrectObject.isVisible = false

--create numeric field
numericfield = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericfield.inputType = "number"
numericfield.isVisible = true

--create lose text
youLose = display.newImageRect( "Images/gameOver.png", 500, 500)
youLose.x = display.contentWidth/2
youLose.y = display.contentHeight/2
youLose.isVisible = false

--create win text
youWin = display.newText( "You Win!", display.contentWidth/2, display.contentHeight*2/3, nil, 70)
youWin.isVisible = false

--create lives text
livesText = display.newText("Lives =" .. lives, display.contentWidth/2, display.contentHeight/3, nil, 50)
livesText:setFillColor(255/255, 255/255, 0/255)
--create points text
pointsText = display.newText("Points =" .. points, display.contentWidth/2, display.contentHeight/4, nil, 50)
pointsText:setFillColor(255/255, 255/255, 0/255)
-- add the event listener for the numeric feild
numericfield:addEventListener( "userInput", NumericFeildListener)

clockText = display.newText( secondsLeft, 100, 720, nil, 50)
clockText:setFillColor(255/255, 0/255, 0/255)

speeder = display.newImageRect("Images/snowspeeder.png", 300, 200)
speeder.x = display.contentWidth - 200
speeder.y = display.contentHeight - 700
speeder.rotation = -45

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--call the functions

AskQuestion()
 StartTimer()




