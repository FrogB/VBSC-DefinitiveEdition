local spin = true;
local defaultNotePos = {};
local modchartX = 0;
local modchartY = 30;
local thefunnyheheharhar = true
local increaseChartY = false;

function onCreate()
    makeAnimatedLuaSprite('static','static', -2625,-2000)addAnimationByPrefix('static','aa','statica',24,true)
    objectPlayAnimation('static','aa',false)
    setScrollFactor('static', 0.9, 0.9);
	scaleObject('static', 10, 10);
    doTweenAlpha('alphastatic', 'static', 0.20, 2, 'quadOut')

    makeLuaSprite('blankbg','blankbg',-740,-380);
	setLuaSpriteScrollFactor('blankbg', 0, 0);
    addLuaSprite('blankbg', false);
	scaleObject('blankbg', 2, 2)
    doTweenAlpha('no', 'blankbg', 0, 0.000000000000000000001, 'quadOut')
end

function onSongStart()

  for i = 0,7 do

      x = getPropertyFromGroup('strumLineNotes', i, 'x')

      y = getPropertyFromGroup('strumLineNotes', i, 'y')

      table.insert(defaultNotePos, {x, y})

      --debugPrint("{" .. x .. "," .. y .. "}" .. "i:" .. i)
  end

end
        function onUpdate(elapsed) 
            
            if curStep >= 0 then
                songPos = getSongPosition()
                local currentBeat = (songPos/400)*(bpm/100)
                doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.15)*math.pi),0.01)
            end

            function onMoveCamera(focus)
                if focus == 'boyfriend' then
                    -- called when the camera focus on boyfriend
                elseif focus == 'dad' then
                    setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
                end
            end
 
            songPos = getPropertyFromClass('Conductor', 'songPosition');

            currentBeat = (songPos / 1000) * (bpm / 150)

            if increaseChartY == true then
                modchartY = modchartY + 0.06
              end
         
         
            if spin == true then
                 for i = 0,7 do 
                     setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.25) * math.pi))
                     setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*0.25) * math.pi))
                 end
            end
        end

function onBeatHit()
songPos = getSongPosition()
local currentBeat = math.floor((songPos/1000)*(bpm/60))

if curBeat %1 == 0 then
    noteTweenAngle('notey1', 0, 160, 1.3, 'quintOut');
    noteTweenAngle('notey2', 1, 160, 1.3, 'quintOut');
    noteTweenAngle('notey3', 2, 160, 1.3, 'quintOut');
    noteTweenAngle('notey4', 3, 160, 1.3, 'quintOut');

    noteTweenAngle('notey5', 4, 160, 1.3, 'quintOut');
    noteTweenAngle('notey6', 5, 160, 1.3, 'quintOut');
    noteTweenAngle('notey7', 6, 160, 1.3, 'quintOut');
    noteTweenAngle('notey8', 7, 160, 1.3, 'quintOut');
 end
 
 if curBeat %2 == 0 then
    noteTweenAngle('notey1', 0, 320, 1.3, 'quintOut');
    noteTweenAngle('notey2', 1, 320, 1.3, 'quintOut');
    noteTweenAngle('notey3', 2, 320, 1.3, 'quintOut');
    noteTweenAngle('notey4', 3, 320, 1.3, 'quintOut');

    noteTweenAngle('notey5', 4, 320, 1.3, 'quintOut');
    noteTweenAngle('notey6', 5, 320, 1.3, 'quintOut');
    noteTweenAngle('notey7', 6, 320, 1.3, 'quintOut');
    noteTweenAngle('notey8', 7, 320, 1.3, 'quintOut');
 end
    if curBeat >= 96 then
        addLuaSprite('static', true);
        increaseChartY = true
    end

   if curBeat >= 122 then
    for i = 4,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', 
        defaultNotePos[i + 1][1] + math.floor(math.random(-150,150)))

        if downscroll == true then 
            ylowest = 50;
            yhighest = -150;
        else 
            ylowest = -150
            yhighest = 150;
        end

        setPropertyFromGroup('strumLineNotes', i, 'y', 
        defaultNotePos[i + 1][2] + math.floor(math.random(ylowest,yhighest)))
    end
   end

        if curBeat >= 123 then
            increaseChartY = false
        end

    if curBeat >= 116 then
      doTweenAlpha('alphastatic', 'static', 0, 0.000000000000000000001, 'quadOut')
    end


   if curBeat >= 227 then
    cancelTween('no')
    doTweenAlpha('yes', 'blankbg', 1, 1, 'quadOut')
    doTweenAlpha('hudgone', 'camHUD', 0, 1, 'quadOut')
    doTweenZoom('gamezoom', 'camGame', 1.5, 2, 'quadOut')
   end
end

function onStepHit()

    if curStep >= 157 then
        setProperty('blankbg.alpha', 1)
    end

    if curStep >= 158 then
        setProperty('blankbg.alpha', 0)
    end

    if curStep >= 159 then
        setProperty('blankbg.alpha', 1)
    end

    if curStep >= 160 then
        setProperty('blankbg.alpha', 0)
    end
end
    