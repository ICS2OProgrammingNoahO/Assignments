----------------------------------------------------------------------------------------
--
-- level4_question.lua
-- Created by: Noah
-- Date: December 11th, 2019
-- Description: This is the level 4 question 
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level4_Question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )




-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText
local answerText1 
local wrongText1
local wrongText2
local wrongText3
local numCorrect = 0
local numIncorrect = 0


local answerPosition = 1
local trueOrFalsePosition = 0
local bkg
local cover
local X1 = display.contentWidth*2/7 + 50
local X2 = display.contentWidth*4/7 + 50
local Y1 = display.contentHeight*1/2 + 50
local Y2 = display.contentHeight*5.5/7 + 50


local userAnswer
local textTouched = false
local answerBox
local answerBox2
local answerBox3
local answerBox4
local questionBox
local firstNumber
local question2Image
local questionImage
local questionmarkText


local selectSound = audio.loadStream("Sounds/cheer.mp3")
local selecSoundChannel




 
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function DisplayQuestion2()
    --creating random numbers
    firstNumber = math.random (1,12)
   
question2Image.isVisible = false
answerBox.isVisible = true
answerBox3.isVisible = true
if (firstNumber == 1) then

    --creating the question depending on the selcetion number
    questionText.text = " What do you call a person who studies science? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A scientist "
    
    --creating wrong answers
    wrongText1.text = " Bill Nye "
    wrongText2.text = " A professor "
    wrongText3.text = " A teacher "
elseif (firstNumber == 2)then
     

     --creating the question depending on the selcetion number
    questionText.text = " How can we save earth? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Recycling "
    
    --creating wrong answers
    wrongText1.text = " Using plastic "
    wrongText2.text = " Littering "
    wrongText3.text = " Using Chemicals "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " What shape is the earth? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A sphere "
    
    --creating wrong answers
    wrongText1.text = " A cube "
    wrongText2.text = " A pyramid "
    wrongText3.text = " A cylinder "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " What makes things fall? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Gravity "
    
    --creating wrong answers
    wrongText1.text = " The sky "
    wrongText2.text = " The wind "
    wrongText3.text = " Nothing "



elseif (firstNumber == 5)then
     --creating the question depending on the selcetion number
    questionText.text = " Which is a science subject? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Structures "
    
    --creating wrong answers
    wrongText1.text = " Addition "
    wrongText2.text = " Maps "
    wrongText3.text = " Painting "


elseif (firstNumber == 6)then
     --creating the question depending on the selcetion number
    questionText.text = " What is the strongest shape? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A triangle "
    
    --creating wrong answers
    wrongText1.text = " A square "
    wrongText2.text = " A circle "
    wrongText3.text = " A hexagon "

elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " What is our galaxy? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The Milky Way "
    
    --creating wrong answers
    wrongText1.text = " The Andromeda "
    wrongText2.text = " Whirlpool Galaxy "
    wrongText3.text = " Sombrero Galaxy "

elseif (firstNumber == 8)then
     --creating the question depending on the selcetion number
    questionText.text = " What powers technonlogy? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Electricity "
    
    --creating wrong answers
    wrongText1.text = " Nothing "
    wrongText2.text = " Temperature "
    wrongText3.text = " Humans "

elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " What do we do in science? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Learn about the world "
    
    --creating wrong answers
    wrongText1.text = " Solve math questions "
    wrongText2.text = " Make wonderful art "
    wrongText3.text = " Nothing "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What can we make from plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Good food "
    
    --creating wrong answers
    wrongText1.text = " Metal "
    wrongText2.text = " A car "
    wrongText3.text = " A phone "



elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " Where do birds live? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " In nests "
    
    --creating wrong answers
    wrongText1.text = " In the water "
    wrongText2.text = " Underground "
    wrongText3.text = " In space "


elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " Where does pollen come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Plant flowers "
    
    --creating wrong answers
    wrongText1.text = " Rocks "
    wrongText2.text = " The sky "
    wrongText3.text = " Nowhere "


end

end



local function PositionAnswers2()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText1.x = X1
        answerText1.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText1.x = X1
        answerText1.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText1.x = X2
        answerText1.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2
            
    end
answerBox.isVisible = true
answerBox3.isVisible = true

end

local function Calculate2( )
    if (numCorrect == 2)then
        
        composer.hideOverlay( "level4_Question", { isModal = true, effect = "fade", time = 500})      
        ResumeGameLevel4()
        
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
       
        composer.hideOverlay( "level4_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level4()

        numCorrect = 0
        numIncorrect = 0
    else   
        
 DisplayQuestion2()
        PositionAnswers2()
       

        
    end
end

local function Question2( )
  
    question2Image.isVisible = true

end

local function TrueOrFalse( )
    trueOrFalsePosition = math.random(1,2)
end
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText1.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then
       
        numCorrect = numCorrect + 1

        Calculate2()
    
    end 
end

local function DisplayQuestion()
    --creating random numbers
    firstNumber = math.random (1,20)
   

if (firstNumber == 1) then

    --creating the question depending on the selcetion number
    questionText.text = " What do you call a person who studies science? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A scientist "
    
    --creating wrong answers
    wrongText1.text = " Bill Nye "
    wrongText2.text = " A professor "
    wrongText3.text = " A teacher "
elseif (firstNumber == 2)then
     

     --creating the question depending on the selcetion number
    questionText.text = " How can we save earth? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Recycling "
    
    --creating wrong answers
    wrongText1.text = " Using plastic "
    wrongText2.text = " Littering "
    wrongText3.text = " Using Chemicals "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " What shape is the earth? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A sphere "
    
    --creating wrong answers
    wrongText1.text = " A cube "
    wrongText2.text = " A pyramid "
    wrongText3.text = " A cylinder "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " What makes things fall? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Gravity "
    
    --creating wrong answers
    wrongText1.text = " The sky "
    wrongText2.text = " The wind "
    wrongText3.text = " Nothing "

elseif (firstNumber == 5)then
     --creating the question depending on the selcetion number
    questionText.text = " Are rocks alive? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 6)then
    --creating the question depending on the selcetion number
    questionText.text = " Is technology part of science? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " Which is a science subject? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Structures "
    
    --creating wrong answers
    wrongText1.text = " Addition "
    wrongText2.text = " Maps "
    wrongText3.text = " Painting "

elseif (firstNumber == 8)then
  --creating the question depending on the selcetion number
    questionText.text = " Do plants breathe? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " What is the strongest shape? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A triangle "
    
    --creating wrong answers
    wrongText1.text = " A square "
    wrongText2.text = " A circle "
    wrongText3.text = " A hexagon "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What is our galaxy? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The Milky Way "
    
    --creating wrong answers
    wrongText1.text = " The Andromeda "
    wrongText2.text = " Whirlpool Galaxy "
    wrongText3.text = " Sombrero Galaxy "

elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " What powers technonlogy? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Electricity "
    
    --creating wrong answers
    wrongText1.text = " Nothing "
    wrongText2.text = " Temperature "
    wrongText3.text = " Humans "

elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " What do we do in science? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Learn about the world "
    
    --creating wrong answers
    wrongText1.text = " Solve math questions "
    wrongText2.text = " Make wonderful art "
    wrongText3.text = " Nothing "

elseif (firstNumber == 13)then
     --creating the question depending on the selcetion number
    questionText.text = " What can we make from plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Good food "
    
    --creating wrong answers
    wrongText1.text = " Metal "
    wrongText2.text = " A car "
    wrongText3.text = " A phone "

elseif (firstNumber == 14)then
     --creating the question depending on the selcetion number
    questionText.text = " Is space real? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 15)then
     --creating the question depending on the selcetion number
    questionText.text = " Where do birds live? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " In nests "
    
    --creating wrong answers
    wrongText1.text = " In the water "
    wrongText2.text = " Underground "
    wrongText3.text = " In space "

elseif (firstNumber == 16)then
    --creating the question depending on the selcetion number
    questionText.text = " Can we survive only eating plants? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 17)then
    --creating the question depending on the selcetion number
    questionText.text = " Is science important? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "


elseif (firstNumber == 18)then
     --creating the question depending on the selcetion number
    questionText.text = " Is space big? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 19)then
     --creating the question depending on the selcetion number
    questionText.text = " Where does pollen come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Plant flowers "
    
    --creating wrong answers
    wrongText1.text = " Rocks "
    wrongText2.text = " The sky "
    wrongText3.text = " Nowhere "

elseif (firstNumber == 20)then
     --creating the question depending on the selcetion number
    questionText.text = " Is language science? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

end

end

local function PositionAnswers2(  )
 if (trueOrFalsePosition == 1)then
        answerText1.x = X1
        answerText1.y = Y1
        wrongText1.x = X2
        wrongText1.y = Y1
 else
         answerText1.x = X2
        answerText1.y = Y1
        wrongText1.x = X1
        wrongText1.y = Y1

 end   

 answerBox.isVisible = false
 answerBox3.isVisible = false
end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText1.x = X1
        answerText1.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText1.x = X1
        answerText1.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText1.x = X2
        answerText1.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2
            
    end
answerBox.isVisible = true
answerBox3.isVisible = true

end


local function Calculate( )
    if (numCorrect == 2)then
        
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})      
        ResumeGameLevel4()
        --questionImage.isVisible = false
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
       
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level4()

        numCorrect = 0
        numIncorrect = 0
    else   
        
 DisplayQuestion()
        PositionAnswers()
        if( trueOrFalsePosition == 1)or
            ( trueOrFalsePosition == 2)then
                PositionAnswers2()
            end

        
    end
end
-----------------------------------------------------------------------------------------



--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then
    
        numIncorrect = numIncorrect + 1
        Calculate()
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then

        numIncorrect = numIncorrect + 1
        Calculate()
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
     if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    
    if (touch.phase == "ended") then
        numIncorrect = numIncorrect + 1
        Calculate()
        
    end 
end
--adding the event listeners 
local function AddTextListeners()
    answerText1:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText1:removeEventListener( "touch", TouchListenerAnswer)
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth + 0.95, display.contentHeight*0.95, 50 )
    cover:setFillColor(255/255, 255/255, 255/255)
    cover.strokeWidth = 9
    cover:setStrokeColor( 255/255, 0/255, 0/255)
    
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)


    questionImage = display.newRect(display.contentWidth/2 - 380, display.contentHeight/2 + 50, 200, 500)
    questionImage.strokeWidth = 20
    questionImage:setFillColor(0/255, 255/255, 0/255)
    questionImage:setStrokeColor(255/255, 255/255, 51/255)

    questionmarkText = display.newText("?", 135, 450, nil, 400)
    questionmarkText:setFillColor(0/255, 0/255, 0/255)

    sceneGroup:insert(questionImage)
    sceneGroup:insert(questionmarkText)


    question2Image = display.newImageRect("Images/WhatIsLeaf.png", 200, 500)
    question2Image.x = display.contentWidth/2 - 380
    question2Image.y = display.contentHeight/2 + 50
    question2Image.strokeWidth = 9
    question2Image:setStrokeColor(255/255, 255/255, 51/255)
    question2Image.isVisible = false

    
    


    answerBox = display.newRect(display.contentCenterX - 70, 650, 300, 60)
    answerBox.strokeWidth = 9
    answerBox:setStrokeColor(255/255, 255/255, 51/255)
     answerBox:setFillColor(0, 1, 0)

    answerBox2 = display.newRect(display.contentCenterX - 70, 430, 300, 60)
    answerBox2.strokeWidth = 9
    answerBox2:setStrokeColor(255/255, 255/255, 51/255)
     answerBox2:setFillColor(0, 1, 0)

    answerBox3 = display.newRect(display.contentCenterX + 250, 650, 280, 60)
    answerBox3.strokeWidth = 9
    answerBox3:setStrokeColor(255/255, 255/255, 51/255)
     answerBox3:setFillColor(0, 1, 0)

    answerBox4 = display.newRect(display.contentCenterX + 250, 430, 280, 60)
    answerBox4.strokeWidth = 9
    answerBox4:setStrokeColor(255/255, 255/255, 51/255)
     answerBox4:setFillColor(0, 1, 0)
    sceneGroup:insert(answerBox)
    sceneGroup:insert(answerBox2)
    sceneGroup:insert(answerBox3)
    sceneGroup:insert(answerBox4)
    sceneGroup:insert(question2Image)
  

    
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 55)
    questionText:setFillColor(0/255, 0/255, 0/255)

    answerText1 = display.newText("", X1, Y2, Arial, 25)
    answerText1.anchorX = 0
    answerText1:setFillColor(0/255, 0/255, 0/255)

    wrongText1 = display.newText("", X2, Y2, Arial, 25)
    wrongText1.anchorX = 0
    wrongText1:setFillColor(0/255, 0/255, 0/255)

    wrongText2 = display.newText("", X1, Y1, Arial, 25)
    wrongText2:setFillColor(0/255, 0/255, 0/255)
    wrongText2.anchorX = 0

    wrongText3 = display.newText("", X2, Y1, Arial, 25)
    wrongText3.anchorX = 0
    wrongText3:setFillColor(0/255, 0/255, 0/255)


    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText1)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
  



end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        AddTextListeners()

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        if( trueOrFalsePosition == 1)or
            ( trueOrFalsePosition == 2)then
                PositionAnswers2()
            end

        


        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
        --composer.removeScene( "level1_Question" )
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup"). 
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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