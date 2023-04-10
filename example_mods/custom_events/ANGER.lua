function onEvent(name, value1, value2)       
	local var string = (value1)
	local var length = tonumber(0 + value2)  
	if name == "ANGER" then
	runTimer('LyricalTho', length, 1)

function onUpdate()
	  makeLuaText('sappin', '', 950, math.random(130, 190), math.random(345, 360))
	  local var angryman = (math.random((1), (7)))
        setTextFont('sappin', 'j.ttf')
        setTextColor('sappin', '0xAEAEAE')
        setTextSize('sappin', 70)
        addLuaText('sappin')
        setTextAlignment('sappin', 'center')
        setObjectCamera("sappin", 'hud');
        if angryman == 1 then
	  setTextString('sappin', "LEA@VE ME AL#ONE")
	end        
if angryman == 2 then
	  setTextString('sappin', "LEAVE M^E A$LONE")
	end        
if angryman == 3 then
	  setTextString('sappin', "LE!AVE ME ALON%E")
	end        
if angryman == 4 then
	  setTextString('sappin', "LEAV/E M#E A|LONE")
	end        
if angryman == 5 then
	  setTextString('sappin', "LEAVE ME AL3ON@E")
	end        
if angryman == 6 then
	  setTextString('sappin', "L%EAVE ME ALO$NE")
      end
if angryman == 7 then
	  setTextString('sappin', "LEAVE ME ALONE")   
end	  
        --removeLuaText('sappin', true)

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'LyricalTho' then
      function onUpdate()  
	removeLuaText('sappin', true)    			
	close(true)
end
end
end	
end
end
end