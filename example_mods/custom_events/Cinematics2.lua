-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

start = 0

finish = 0



function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar11', 'empty', 0, -120)
	makeGraphic('UpperBar11', 1280, 120, '000000')
	setObjectCamera('UpperBar11', 'hud')
	addLuaSprite('UpperBar11', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar1', 'empty', 0, 720)
	makeGraphic('LowerBar1', 1280, 120, '000000')
	setObjectCamera('LowerBar1', 'hud')
	addLuaSprite('LowerBar1', false)

end


function onUpdate()

	if start == 1 then
	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 1)
	doTweenAlpha('AlphaTween2', 'healthBar', 0.0, 1)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0.1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 1)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 1)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	end

	if downscroll and start == 1 then
	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 1)
	doTweenAlpha('AlphaTween2', 'healthBar', 0.0, 1)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0.1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 1)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 1)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	if getProperty('health') <= 0.4 then
	doTweenAlpha('AlphaTween4', 'iconP1', 0.55, 2);
	doTweenAlpha('AlphaTween5', 'iconP2', 0.55, 2)
	if getProperty('health') >= 0.8 then
	doTweenAlpha('AlphaTween4', 'iconP1', 0.55, 2);
	doTweenAlpha('AlphaTween5', 'iconP2', 0.55, 2)
	if mustHitSection == false then
	doTweenAlpha('AlphaTween2', 'healthBar', 0.1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0.55, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0.55, 0.25)

	end	
	end
	end
	end


	if finish == 2 then
	
	if mustHitSection == false then
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
	
	end
	end

	if downscroll and finish == 2 then

	if mustHitSection == false then
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
	
	end
	end
end

function onEvent(name,value1,value2)
	if name == 'Cinematics2' then
		start = tonumber(value1)
		finish = tonumber(value2)
			end
	
		end
