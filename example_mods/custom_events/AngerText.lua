function onCreatePost()
	makeLuaSprite("shitsSSSAS","thisIsForTheScreen",-10,-10)
	setObjectCamera("shitsSSSAS",'other') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shitsSSSAS",true)
	makeGraphic("shitsSSSAS",screenWidth+100,screenHeight+100,"000000")
	setProperty("shitsSSSAS.alpha",0)
end

function onEvent(name, value1, value2)
	local var string = (value1)
	local var length = tonumber(0 + value2)
	if name == "AngerText" then
		runTimer('lyricalThou', length, 1)
		doTweenAlpha("shitScreenFadee","shitsSSSAS",0.5,0.25)
		--hi viv :)
        
function onUpdate()
	  makeLuaText('nappin', '', 950, math.random(145, 175), math.random(345, 360))
        setTextString('nappin',  '' .. string)
        setTextFont('nappin', 'j.ttf')
        setTextColor('nappin', '0xAEAEAE')
        setTextSize('nappin', 50);
        addLuaText('nappin')
        setTextAlignment('nappin', 'center')
        setObjectCamera("nappin", 'hud');
        --removeLuaText('nappin', true)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalThou' then
      function onUpdate()  
	  removeLuaText('nappin', true)    			
      doTweenAlpha("shitScreenFadee","shitsSSSAS",0,0.25)
close(true) 			
end
end	
end
end
end