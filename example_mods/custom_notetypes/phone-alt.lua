function onCreate() -- used for alt animations (the phone mechanic is called phone.lua if yoy wanna find that)
  for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone-alt' and not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_phone')
  		setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')
  		setPropertyFromGroup('unspawnNotes', i, 'offset.x', -4)
		end
	end
end