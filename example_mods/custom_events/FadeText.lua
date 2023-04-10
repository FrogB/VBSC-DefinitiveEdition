function onCreatePost()
	makeLuaSprite("shitssAs","thisIsForTheScreen",-10,-10)
	setObjectCamera("shitssAs",'other') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shitssAs",true)
	makeGraphic("shitssAs",screenWidth+100,screenHeight+100,"000000")
	setProperty("shitssAs.alpha",0)
end

function onEvent(name, value1, value2)
	local var string = (value1)
	local var length = tonumber(0 + value2)
	if name == "FadeText" then
		doTweenAlpha("shitScreenFade","shitssAs",0.5,0.25)
		--hi viv :)
        makeLuaText('yappin', 'Lyrics go here!', 950, 160, 360)
        setTextString('yappin',  '' .. string)
        setTextFont('yappin', 'j.ttf')
        setTextColor('yappin', '0xAEAEAE')
        setTextSize('yappin', 40);
        addLuaText('yappin')
        setTextAlignment('yappin', 'center')
        setObjectCamera("yappin", 'hud');
        runTimer('lyricalTho', length, 1)
        --removeLuaText('yappin', true)

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalTho' then
        removeLuaText('yappin', true)
        doTweenAlpha("shitScreenFade","shitssAs",0,0.25)    			
end
		end
	end
end