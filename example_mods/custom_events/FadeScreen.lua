function onCreatePost()
	makeLuaSprite("shitsAss","thisIsForTheScreen",-10,-10)
	setObjectCamera("shitsAss",'other') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shitsAss",true)
	makeGraphic("shitsAss",screenWidth+100,screenHeight+100,"000000")
	setProperty("shitsAss.alpha",0)
end

function onEvent(name, value1, value2)
	if name == "FadeScreen" then
		doTweenAlpha("shitScreenFade","shitsAss",value1,value2)
		--hi viv :)
	end
end