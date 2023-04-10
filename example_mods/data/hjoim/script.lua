
function onCreate()
  setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
  cameraShake(game, 0.005, 0.05)
  cameraSetTarget('dad')
  health = getProperty('health')
	if health > 0.2 then
		setProperty('health', health - 0.005);	
	end
end

function onUpdate(elapsed)
    if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
  end
