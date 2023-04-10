local defaultNotePos = {};
local spin = true;
local modchartX = 690;
local modchartY = 420;

function onStartCountdown()
	setProperty('health', 2)
end


function opponentNoteHit()
    triggerEvent('Screen Shake', '0.8, 0.01', '0.1, 0.01');
    health = getProperty('health')
    if getProperty('health') > 1 then
       setProperty('health', health- 0.03);
    end
end

    function onSongStart()
      for i = 0,7 do
        x = getPropertyFromGroup("strumLineNotes", i, "x")
    
        y = getPropertyFromGroup("strumLineNotes", i, "y")
    
        table.insert(defaultNotePos, {x,y})
    
        --debugPrint("(" .. x .. "," .. y .. ")" .. "i: " .. i)
      end
    end
  

    
function onUpdate(elapsed)
    if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end

    songPos = getPropertyFromClass('Conductor', 'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 100)
 
 
    if spin == true then
         for i = 0,7 do 
             setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + modchartX * math.sin((currentBeat + i*0.69) * math.pi))
             setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + modchartY * math.sin((currentBeat + i*0.420) * math.pi))
         end
     end
end
  