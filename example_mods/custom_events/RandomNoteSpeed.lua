function onEvent(n,v1,v2) --Made By CMarkV
	if n == 'RandomNoteSpeed' then
		if v1 == "1" then
			for i = -1, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(0.8, 1.2))
					end
				end
			end
		elseif v1 == "1off" then
			for i = -1, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1)
					end
				end
			end
		elseif v1 == "2" then
			for i = -2, getProperty('unspawnNotes.length')-2 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(0.8, 1.2))
					end
				end
			end
		elseif v1 == "2off" then
			for i = -2, getProperty('unspawnNotes.length')-2 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1)
					end
				end
			end
		elseif v1 == "3" then
			for i = -1, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(0.8, 1.2))
					end
				end
			end
			for i = -2, getProperty('unspawnNotes.length')-2 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', math.random(0.8, 1.2))
					end
				end
			end
		end
		elseif v1 == "3off" then
			for i = -1, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1)
					end
				end
			end
			for i = -2, getProperty('unspawnNotes.length')-2 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					if getPropertyFromGroup('unspawnNotes', i, 'multSpeed') then
						setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1)
					end
				end
			end
		end
	end