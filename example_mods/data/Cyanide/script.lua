
function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/155)
    doTweenY(dadTweenY, 'dad', 270-80*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end
