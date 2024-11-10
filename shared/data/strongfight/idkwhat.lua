local elapsedTime = 0
function onUpdate(elapsed)
	if curStep >= 960 and curStep <= 1097 then
	elapsedTime = elapsedTime + elapsed
	setCharacterX("dad", getCharacterX("dad") + (math.sin(elapsedTime * 2) * 1.2))
	setCharacterY("dad", getCharacterY("dad") - (math.cos(elapsedTime * 4) * 1.2))

	if(not mustHitSection) then
	cameraSetTarget("dad")
	end
	end
end