local defaultNotePos = {}
local spin = 12 -- how much it moves before going the other direction
 

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
    
    if curStep >= 0 and curStep < 999999999999 then
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
    if curStep == 99999999999999999 then
        setProperty("camHUD.angle", 0)
    end
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/200)
        doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
      end
    if curStep == 1136 then 
        health = getProperty('health')
        setProperty('health', health + 3)
    end
    if curStep == 1145 then 
        health = getProperty('health')
        setProperty('health', health + 2)
    end
    if curStep == 1273 then 
        health = getProperty('health')
        setProperty('health', health + 2)
    end
    if curStep == 1278 then 
        health = getProperty('health')
        setProperty('health', health + 2)
    end
end

function onCreate()
    setProperty('camGame.zoom', 3)
    doTweenZoom('begin', 'camGame', '0.6', 5, 'quadOut')
    setProperty('camHUD.zoom', 3)
    doTweenZoom('begin2', 'camHUD', '1', 5, 'quadOut')
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.80 then
       setProperty('health', health- 0.01);
    end
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
end
