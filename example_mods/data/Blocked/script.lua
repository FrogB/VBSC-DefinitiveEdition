local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onUpdate(elapsed) -- i think this did a small tween to the notes when the song started. looks cool i guess?
	if curStep >= 256 and curStep < 766 then
		function onBeatHit()
    		if getProperty('curBeat') % 4 == 0 then
				triggerEvent('Add Camera Zoom', '', '')
			end
			if getProperty('curBeat') % 4 == 2 then
				triggerEvent('Add Camera Zoom', '', '')
			end
		end
	end
	if curStep >= 767 and curStep < 1727 then
		function onBeatHit()
    		if getProperty('curBeat') % 4 == 0 then
				triggerEvent('Add Camera Zoom', '', '')
			end
			if getProperty('curBeat') % 4 == 1 then
				triggerEvent('Add Camera Zoom', '', '')
			end
			if getProperty('curBeat') % 4 == 2 then
				triggerEvent('Add Camera Zoom', '', '')
			end
			if getProperty('curBeat') % 4 == 3 then
				triggerEvent('Add Camera Zoom', '', '')
			end
		end
	end
	if curStep >= 1728 and curStep < 1856 then -- had to do a duplicate of the first part coz the middle part (consisting of 4 zooms per curbeat) clashes with the first part lol
		function onBeatHit()
    		if getProperty('curBeat') % 4 == 0 then
				triggerEvent('Add Camera Zoom', '', '')
			end
			if getProperty('curBeat') % 4 == 2 then
				triggerEvent('Add Camera Zoom', '', '')
			end
		end
	end
end