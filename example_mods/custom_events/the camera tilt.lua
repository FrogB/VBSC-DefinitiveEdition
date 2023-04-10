function onEvent(name,value1,value2)
if name == "the camera tilt" then

local xx = -200;
local yy = 0;
local xx2 = 1280;
local yy2 = 0;
local xx3 = 520;
local yy3 = 480;
local ofs = 175;
local ofs2 = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local hi = false;

function onUpdate()
if value1 == '0' then
triggerEvent('Camera Follow Pos',' ',' ');
doTweenAngle('bruhmomento', 'camGame', 0, 0.5, 'cubeOut'); 
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
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
	    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                doTweenAngle('bruhmomento', 'camGame', 2.5, 0.5, 'cubeOut');
                triggerEvent('Camera Follow Pos',xx+800+ofs,yy-100)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                doTweenAngle('bruhmomento', 'camGame', 0, 0.5, 'cubeOut');
                triggerEvent('Camera Follow Pos',xx-150,yy-700-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                doTweenAngle('bruhmomento', 'camGame', 0, 0.5, 'cubeOut');
                triggerEvent('Camera Follow Pos',xx+400,yy+300+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                doTweenAngle('bruhmomento', 'camGame', -2.5, 0.5, 'cubeOut');
                triggerEvent('Camera Follow Pos',xx-400-ofs,yy-400)
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
            if getProperty('dad.animation.curAnim.name') == 'Idle' then
                doTweenAngle('bruhmomento', 'camGame', 0, 0.5, 'cubeOut');  
            end
			else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2);              
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then                                
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2);
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'Idle' then
                doTweenAngle('bruhmomento', 'camGame', 0, 0.5, 'cubeOut');  
            end       
	end
	end
	end
	end
	end
	