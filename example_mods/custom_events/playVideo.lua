function onCreate(name, value1, value2)
	startVideo(value1)
	return Function_Stop
end	
function onEvent(name, value1, value2)
	if name == 'playVideo' then
         startVideo(value1)
         return Function_Stop
    end
    return Function_Continue
end