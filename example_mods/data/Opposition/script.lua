local lmaowindow = true;
local windowX = 200;


function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/200)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
  local songPosSpin = getPropertyFromClass('Conductor', 'songPosition') / 500 --How long it will take.
  if curStep >= 0 and curStep < 50000 then
    setProperty("camHUD.angle", 5 * math.sin(songPosSpin))
    setProperty("camGame.angle", 5 * math.sin(songPosSpin))
  end

  if curStep == 50000 then
    setProperty("camHUD.angle", 0)
  end
end

function noteMiss(direction)
  setProperty('health', getProperty('health') + 0.0025)
  end
  function noteMissPress(direction)
  setProperty('health', getProperty('health') + 0.0025)
  end

local blockEnd = true;
function onEndSong()
  if not allowEnd and isStoryMode and not isStoryMode then
    lmaowindow = false;
		allowEnd = true;
  end
end


local angleshit = 2;
local anglevar = 2;

function onCreate()
  setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end

function opponentNoteHit()
  health = getProperty('health')
  if getProperty('health') > 0.80 then
     setProperty('health', health- 0.01);
  end
  triggerEvent('Screen Shake', '0.01, 0.01', '0.05, 0.01');
end