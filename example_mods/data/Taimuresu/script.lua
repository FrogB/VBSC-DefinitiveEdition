local noteDefaultXs = {}
local noteDefaultYs = {}
local noteXs = {}
local noteYs = {}
local windowthingy = true;
local windowX = 300;
local windowY = 200;
local windowscaleX1 = 0
local windowscaleY1 = 0
local windowscaleX2 = 0
local windowscaleY2 = 0
local windowscalemult = -1
local doFlash = true
local doFade = true

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getPropertyFromClass('ClientPrefs', 'windowMove') == true then -- so that people dont get their eyes blind
	windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
 	windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-25,25))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-10,10))
	end

	cameraShake(game, 0.015, 0.2)
	cameraSetTarget('dad')
	characterPlayAnim('gf', 'scared', true)
	doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
	setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	cameraSetTarget('boyfriend')
end
	
function noteMiss(direction)
	setProperty('health', getProperty('health') + 0.023)
end
function noteMissPress(direction)
	setProperty('health', getProperty('health') + 0.023)
end

function onSongStart()
	doTweenAlpha('fade1','blackfade',0,5,'linear')
	for i = 0,7 do
	  noteDefaultXs[i] = -25+i*110
	  noteDefaultYs[i] = 60
	  noteXs[i] = 0
	  noteYs[i] = 0
	end
end
function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)
	setProperty('gf.y',-100+math.sin(currentBeat*math.pi/8)*100)
	setProperty('gf.angle',0+currentBeat*2)
end
