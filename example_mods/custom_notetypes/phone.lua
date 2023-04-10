function onCreate()
  for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone' and not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_phone')
  		setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
  		setPropertyFromGroup('unspawnNotes', i, 'offset.x', -4)
		end
	end
end
function goodNoteHit(id, data, type, sus)
  if type == 'phone' then
    playAnim('boyfriend', 'dodge', true)
    setProperty('boyfriend.specialAnim', true)
    playAnim('dad', 'singThrow', true)
    setProperty('dad.specialAnim', true)
  end
end
function noteMiss(id, data, type, sus)
  if type == 'phone' then
    playAnim('boyfriend', 'hurt', true)
    setProperty('boyfriend.specialAnim', true)
    playAnim('dad', 'singThrow', true)
    setProperty('dad.specialAnim', true)
    
    setPropertyFromGroup('playerStrums', data, 'alpha', 0)
    noteTweenAlpha('comeBack'..data, data+4, 1, 8, 'cubeIn')
  end
end
function opponentNoteHit(id, data, type, sus) --ONLY USED FOR BAMBIS PHONE SMASH HOLY SHIT CAN YALL STOP GETTING CONFUSED LMAO????
  if type == 'phone' then
    playAnim('dad', 'hey', true)
    setProperty('dad.specialAnim', true)
  end
end