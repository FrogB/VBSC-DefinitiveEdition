

    function opponentNoteHit(id, direction, noteType, isSustainNote)
        cameraShake(game, 0.02, 0.2)
        cameraSetTarget('dad')
        characterPlayAnim('gf', 'scared', true)
        doTweenZoom('camerazoom','camGame',0.55,0.15,'quadInOut')
        setProperty('health', getProperty('health') - 3 * ((getProperty('health')/22))/6)
        end

        
        function noteMiss(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        function noteMissPress(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        
    
    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/75)
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end


    end
    