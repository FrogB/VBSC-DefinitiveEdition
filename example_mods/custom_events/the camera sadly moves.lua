function onCreatePost()
	makeLuaSprite("shitsAss","thisIsForTheScreen",-10,-10)
	setObjectCamera("shitsAss",'other') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shitsAss",true)
	makeGraphic("shitsAss",screenWidth+100,screenHeight+100,"000000")
	setProperty("shitsAss.alpha",0)
end

function onEvent(name,value1,value2)
if name == "the camera sadly moves" then

local xx = 375;
local yy = 480;
local xx2 = 1750;
local yy2 = 480;
local ofs = 45;
local followchars = true;
local del = 0;
local del2 = 0;
local hi = false;

function onUpdate()
if value1 == '0' then
triggerEvent('Camera Follow Pos',' ',' ')
return
end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-15-ofs,yy)
		doTweenAlpha("shitScreenFade","shitsAss",0.1,0.15)            
		end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+150+ofs,yy-50)
		doTweenAlpha("shitScreenFade","shitsAss",0.1,0.15)  
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs-100)
		doTweenAlpha("shitScreenFade","shitsAss",0.1,0.15)  
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs+50)
		doTweenAlpha("shitScreenFade","shitsAss",0.1,0.15)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
		doTweenAlpha("shitScreenFade","shitsAss",0.4,0.8)
            end
			else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2);
		doTweenAlpha("shitScreenFade","shitsAss",0.45,0.4)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2);
		doTweenAlpha("shitScreenFade","shitsAss",0.45,0.4)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs);
		doTweenAlpha("shitScreenFade","shitsAss",0.45,0.4)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs);
		doTweenAlpha("shitScreenFade","shitsAss",0.45,0.4)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2);
		doTweenAlpha("shitScreenFade","shitsAss",0.2,2)
            end
	end
	end
	end
	end
	end
	