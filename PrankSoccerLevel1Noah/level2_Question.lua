----------------------------------------------------------------------------------------
--
-- level2_question.lua
-- Created by: Noah
-- Date: December 11th, 2019
-- Description: This is the level 2 question 
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
sceneName = "level2_Question"

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
    firstNumber = math.random (1,20)
   
question2Image.isVisible = false
if (firstNumber == 1) then

    --creating the question depending on the selcetion number
    questionText.text = " What do plants give us? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Oxygen "
    
    --creating wrong answers
    wrongText1.text = " Plastic "
    wrongText2.text = " Stone "
    wrongText3.text = " Electricity "
elseif (firstNumber == 2)then
     
   question2Image.isVisible = true
     --creating the question depending on the selcetion number
    questionText.text = " What is this? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Root "
    
    --creating wrong answers
    wrongText1.text = " Stem "
    wrongText2.text = " Leaf "
    wrongText3.text = " Seed "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants need to survive? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Soil, water, sunlight "
    
    --creating wrong answers
    wrongText1.text = " Sleep, soil, sunlight "
    wrongText2.text = " Internet, flowers, water "
    wrongText3.text = " Just Water "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " What do humans need? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Oxygene (air) "
    
    --creating wrong answers
    wrongText1.text = " Cars "
    wrongText2.text = " Electricity "
    wrongText3.text = " Math "

elseif (firstNumber == 5)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants need to survive? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Soil, water, sunlight "
    
    --creating wrong answers
    wrongText1.text = " Sleep, soil, sunlight "
    wrongText2.text = " Internet, flowers, water "
    wrongText3.text = " Just Water "

elseif (firstNumber == 6)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants need to survive? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Soil, water, sunlight "
    
    --creating wrong answers
    wrongText1.text = " Sleep, soil, sunlight "
    wrongText2.text = " Internet, flowers, water "
    wrongText3.text = " Just Water "


elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " Who makes food for the plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The plants "
    
    --creating wrong answers
    wrongText1.text = " Amazing Chefs "
    wrongText2.text = " Their parents "
    wrongText3.text = " Animals "

elseif (firstNumber == 8)then
     --creating the question depending on the selcetion number
    questionText.text = " Who makes food for the plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The plants "
    
    --creating wrong answers
    wrongText1.text = " Amazing Chefs "
    wrongText2.text = " Their parents "
    wrongText3.text = " Animals "
elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " Which part of a plant makes pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The flowers "
    
    --creating wrong answers
    wrongText1.text = " The stem "
    wrongText2.text = " The leaves "
    wrongText3.text = " The roots "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What planet are we on? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Earth "
    
    --creating wrong answers
    wrongText1.text = " Jupiter "
    wrongText2.text = " Mars "
    wrongText3.text = " Kepler 16b "

elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " What can water change into? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Ice "
    
    --creating wrong answers
    wrongText1.text = " Lava "
    wrongText2.text = " Rock "
    wrongText3.text = " Nothing "

elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " What comes from clouds? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Rain "
    
    --creating wrong answers
    wrongText1.text = " Sunlight "
    wrongText2.text = " Cotton candy "
    wrongText3.text = " Nutrients "

elseif (firstNumber == 13)then
     --creating the question depending on the selcetion number
    questionText.text = " What animals eat plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Herbivores "
    
    --creating wrong answers
    wrongText1.text = " Carnivores "
    wrongText2.text = " Omnivores "
    wrongText3.text = " No animals "

elseif (firstNumber == 14)then
      --creating the question depending on the selcetion number
    questionText.text = " What animals eat plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Herbivores "
    
    --creating wrong answers
    wrongText1.text = " Carnivores "
    wrongText2.text = " Omnivores "
    wrongText3.text = " No animals "

elseif (firstNumber == 15)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Seeds "
    
    --creating wrong answers
    wrongText1.text = " Eggs "
    wrongText2.text = " The sky "
    wrongText3.text = " Just from soil "

elseif (firstNumber == 16)then
     --creating the question depending on the selcetion number
    questionText.text = " What comes from clouds? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Rain "
    
    --creating wrong answers
    wrongText1.text = " Sunlight "
    wrongText2.text = " Cotton candy "
    wrongText3.text = " Nutrients "

elseif (firstNumber == 17)then
       --creating the question depending on the selcetion number
    questionText.text = " What do plants come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Seeds "
    
    --creating wrong answers
    wrongText1.text = " Eggs "
    wrongText2.text = " The sky "
    wrongText3.text = " Just from soil "


elseif (firstNumber == 18)then
   --creating the question depending on the selcetion number
    questionText.text = " What are the branches of trees made of? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Wood "
    
    --creating wrong answers
    wrongText1.text = " Metal "
    wrongText2.text = " Plastic "
    wrongText3.text = " Stone "

elseif (firstNumber == 19)then
     --creating the question depending on the selcetion number
    questionText.text = " What are the branches of trees made of? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Wood "
    
    --creating wrong answers
    wrongText1.text = " Metal "
    wrongText2.text = " Plastic "
    wrongText3.text = " Stone "

elseif (firstNumber == 20)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Seeds "
    
    --creating wrong answers
    wrongText1.text = " Eggs "
    wrongText2.text = " The sky "
    wrongText3.text = " Just from soil "

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
        
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})      
        ResumeGameLevel2()
        
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
       
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level2()

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
    questionText.text = " What do plants give us? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Oxygen "
    
    --creating wrong answers
    wrongText1.text = " Plastic "
    wrongText2.text = " Stone "
    wrongText3.text = " Electricity "
elseif (firstNumber == 2)then
     
    Question2()
     --creating the question depending on the selcetion number
    questionText.text = " What is this? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Stem "
    
    --creating wrong answers
    wrongText1.text = " Root "
    wrongText2.text = " Leaf "
    wrongText3.text = " Seed "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants need to survive? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Soil, water, sunlight "
    
    --creating wrong answers
    wrongText1.text = " Sleep, soil, sunlight "
    wrongText2.text = " Internet, flowers, water "
    wrongText3.text = " Just Water "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " What do humans need? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Oxygene (air) "
    
    --creating wrong answers
    wrongText1.text = " Cars "
    wrongText2.text = " Electricity "
    wrongText3.text = " Math "

elseif (firstNumber == 5)then
     --creating the question depending on the selcetion number
    questionText.text = " Are plants alive? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 6)then
    --creating the question depending on the selcetion number
    questionText.text = " Is the sun good for plants? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " Who makes food for the plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The plants "
    
    --creating wrong answers
    wrongText1.text = " Amazing Chefs "
    wrongText2.text = " Their parents "
    wrongText3.text = " Animals "

elseif (firstNumber == 8)then
  --creating the question depending on the selcetion number
    questionText.text = " Are nutrients good for a plant? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " Which part of a plant makes pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The flowers "
    
    --creating wrong answers
    wrongText1.text = " The stem "
    wrongText2.text = " The leaves "
    wrongText3.text = " The roots "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What planet are we on? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Earth "
    
    --creating wrong answers
    wrongText1.text = " Jupiter "
    wrongText2.text = " Mars "
    wrongText3.text = " Kepler 16b "

elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " What can water change into? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Ice "
    
    --creating wrong answers
    wrongText1.text = " Lava "
    wrongText2.text = " Rock "
    wrongText3.text = " Nothing "

elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " What comes from clouds? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Rain "
    
    --creating wrong answers
    wrongText1.text = " Sunlight "
    wrongText2.text = " Cotton candy "
    wrongText3.text = " Nutrients "

elseif (firstNumber == 13)then
     --creating the question depending on the selcetion number
    questionText.text = " What animals eat plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Herbivores "
    
    --creating wrong answers
    wrongText1.text = " Carnivores "
    wrongText2.text = " Omnivores "
    wrongText3.text = " No animals "

elseif (firstNumber == 14)then
     --creating the question depending on the selcetion number
    questionText.text = " Do plants need water? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 15)then
     --creating the question depending on the selcetion number
    questionText.text = " What do plants come from? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Seeds "
    
    --creating wrong answers
    wrongText1.text = " Eggs "
    wrongText2.text = " The sky "
    wrongText3.text = " Just from soil "

elseif (firstNumber == 16)then
    --creating the question depending on the selcetion number
    questionText.text = " Do humans need soil? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 17)then
    --creating the question depending on the selcetion number
    questionText.text = " Is the sun hot? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "


elseif (firstNumber == 18)then
     --creating the question depending on the selcetion number
    questionText.text = " Can you see the sun at night? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 19)then
     --creating the question depending on the selcetion number
    questionText.text = " What are the branches of trees made of? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Wood "
    
    --creating wrong answers
    wrongText1.text = " Metal "
    wrongText2.text = " Plastic "
    wrongText3.text = " Stone "

elseif (firstNumber == 20)then
     --creating the question depending on the selcetion number
    questionText.text = " Do animals need plants? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
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
        ResumeGameLevel2()
        --questionImage.isVisible = false
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
       
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level2()

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


    question2Image = display.newImageRect("Images/WhatIsStem.png", 200, 500)
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