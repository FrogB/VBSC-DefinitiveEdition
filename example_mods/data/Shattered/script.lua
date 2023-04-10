function onUpdate(elapsed)
    if dadName == 'bambioverthink' then
        songPos = getSongPosition()
        local currentBeat = (songPos/300)*(curBpm/100)
        local currentBeat2 = (songPos/1234)*(curBpm/100)
        doTweenY(dadTweenY, 'dad', 300-110*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
end