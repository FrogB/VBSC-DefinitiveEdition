function onUpdate(elapsed)
    if curStep >= 704 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        doTweenY('pissmanmove', 'boyfriend', curBeat*math.sin((currentBeat+2*2)*math.pi), 2)
        doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
        doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
	doTweenAngle('pissmanisontheway', 'boyfriend', -0 - 10*math.sin((currentBeat+2*2)*-math.pi), 2)
    if curStep >= 1279 then
        doTweenY('pissmanmove', 'boyfriend', 350, 2)
        doTweenX('disruptor2', 'nuhuh', 0*math.sin((currentBeat+0*0)*math.pi), 6)
        doTweenY('disruptor2', 'no', 0*math.sin((currentBeat+0*0)*math.pi), 6)
	doTweenAngle('pissmanisontheway', 'boyfriend', -0*math.sin((currentBeat+0*0)*math.pi), 2)
end
end
end
