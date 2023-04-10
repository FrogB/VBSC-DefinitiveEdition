bruh = 3
easingstyle = "sineInOut"
local shake = 0
local blink = 0.5
local sinmult = 0
local offset = 0

function onCreate()
	setProperty('skipCountdown',true)
    makeLuaSprite('hpnew1', '', 910, -120)
    makeLuaSprite('hpnew2', '', 615, -120)
    makeLuaSprite('hpnew3', '', 610, -273)
    setObjectCamera('hpnew1', 'HUD')
    setObjectCamera('hpnew2', 'HUD')
    setObjectCamera('hpnew3', 'HUD')
	setProperty('hpnew1.angle',-90)
	setProperty('hpnew2.angle',-90)
	setProperty('hpnew3.angle',90)
	makeGraphic('hpnew1', 40, 295, '00FFFF')
	makeGraphic('hpnew2', 40, 295, '00AA00')
	makeGraphic('hpnew3', 50, 600, '000000')
	addLuaSprite('hpnew3',true)
	addLuaSprite('hpnew1',true)
	addLuaSprite('hpnew2',true)
    setObjectOrder('hpnew1', 2)
    setObjectOrder('hpnew2', 2)
    setObjectOrder('hpnew3', 1)
end

function onUpdate()
	songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)
	shake = shake*0.83
	sinmult = sinmult*0.7
	setProperty("timeBar.alpha",1)
	setProperty("timeTxt.alpha",1)
	setProperty("gf.scale.x",0.4)
	setProperty("gf.scale.y",0.4)
	setProperty("gf.y",150+math.sin(currentBeat*math.pi/16)*200)
	setProperty("dad.y",130+math.sin(currentBeat*math.pi/8)*100)
	setProperty("boyfriend.y",400+math.sin(currentBeat*math.pi/32)*100)
	setProperty("dad.angle",10+math.cos(currentBeat*math.pi/-8)*7)
	setProperty("gf.x",-1500+math.fmod(currentBeat*100,3200))
	setProperty("gf.angle",currentBeat*10)
	setProperty("scoreTxt.alpha",1)
	setProperty("healthBar.alpha", 1)
	setProperty("iconP2.alpha", 1)
	setProperty("iconP1.alpha", 1)
	setProperty("background.scale.x",4+math.sin(currentBeat*math.pi/4)*0.4)
	setProperty("background.scale.y",4+math.cos(currentBeat*math.pi/4)*0.4)
	setProperty("background.x",-900)
	setProperty("background.y",-700+math.sin(currentBeat*math.pi/16)*200)
	
	setProperty("camHUD.angle",math.sin(currentBeat*math.pi/4)*2)
	hp = getProperty('health')
end