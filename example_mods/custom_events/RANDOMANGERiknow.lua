function onCreatePost()
	makeLuaSprite("shit2","thisIsForTheScreen",-10,-10)
	setObjectCamera("shit2",'other') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shit2",true)
	makeGraphic("shit2",screenWidth+100,screenHeight+100,"000000")
	setProperty("shit2.alpha",0)
end

function onEvent(name, value1, value2)
	local var length = tonumber(0 + value2)
	if name == "RANDOMANGERiknow" then
		runTimer('lyricalTheoou', length, 1)
		doTweenAlpha("shit2ScreennFadeee","shit2",0.3,0.25)
		--hi viv :)
function onUpdate()
	  e = math.random(-18,18)
	  local var string = (value1)
	  makeLuaText('' .. e, '' .. string, 950, math.random(-200, 540), math.random(0, 640))
        setTextFont('' .. e, 'j.ttf')
        setTextColor('' .. e, '0xAEAEAE')
        setTextSize('' .. e, 50);
        addLuaText('' .. e)
        setTextAlignment('' .. e, 'center')
        setObjectCamera("bappin", 'hud');
        --removeLuaText('' .. e, true)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalTheoou' then
      function onUpdate()  
	for i = -18,18 do
	removeLuaText(i,true)	    			
      doTweenAlpha("shit2ScreennFadeee","shit2",0,0.25)
close(true) 			
end
end
end	
end
end
end