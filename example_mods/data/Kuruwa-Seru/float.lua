canFloat = false
floatX = true --if you want your char to float left and right set this to true
bfFloat = false -- if bf floats
speedY = 10 --how fast it will go up and down
speedX = 15 --how fast it will go left and right
amplitudeY = 145 --how far up and down it will go in pixels
amplitudeX = 95 --how far left and right  it will go in pixels
ofs = 0 --how far up or down you want the character to be
yy = 0 --dont change this
xx = 0 --or this
bf_xx = 0 --or this
bf_yy = 0 --or this

function onCreatePost()
    yy = getProperty('dad.y')+ofs
    xx = getProperty('dad.x')
  bf_yy = getProperty('boyfriend.y')+ofs
    bf_xx = getProperty('boyfriend.x')
    canFloat = true
end

function onUpdate()
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/345)
    if canFloat then
        if floatX then
            setProperty('dad.x', amplitudeX*math.cos(currentBeat*speedX)+xx)
      if bfFloat then
        setProperty('boyfriend.x', (amplitudeX*math.cos(currentBeat*speedX)+bf_xx)*-1)
      end
        end
    setProperty('dad.y', amplitudeY*math.sin(currentBeat*speedY)+yy)
    if bfFloat then
          setProperty('boyfriend.y', (amplitudeY*math.sin(currentBeat*speedY)+bf_yy)*-1)
    end
    end
end
function onStepHit()
    if curstep == 1000 then
        canFloat = false
    end
end