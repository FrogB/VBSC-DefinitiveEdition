function onUpdate(elapsed)
        if curStep >= 640 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        doTweenY('opponentmove', 'dad', curBeat*math.sin((currentBeat+2*2)*math.pi), 2);
        doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6);
        doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6);
	doTweenAngle('opponentmoves', 'dad', -0 - 20*math.cos((currentBeat+2*2)*-math.pi), 2);
    	if curStep >= 768 then
 	doTweenY('RONmove', 'gf', -400-curBeat*math.sin((currentBeat+2*2)*math.pi), 2);
        doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6);
        doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6);
	doTweenAngle('RONmoves', 'gf', curStep^2-589824, 43.88, linear );
	if curStep >= 1279 then
        doTweenY('opponentmove', 'dad', 350, 2);
        doTweenX('disruptor2', 'nuhuh', 0*math.sin((currentBeat+0*0)*math.pi), 6);
        doTweenY('disruptor2', 'no', 0*math.sin((currentBeat+0*0)*math.pi), 6);
	doTweenAngle('opponentmoves', 'dad', -0*math.sin((currentBeat+0*0)*math.pi), 2);
        doTweenY('RONmove', 'gf', 25, 5);
        doTweenX('disruptor2', 'nuhuh', 0*math.sin((currentBeat+0*0)*math.pi), 6);
        doTweenY('disruptor2', 'no', 0*math.sin((currentBeat+0*0)*math.pi), 6);
	doTweenAngle('RONmoves', 'gf', 0, 1, linear);
end 
end
end
end
