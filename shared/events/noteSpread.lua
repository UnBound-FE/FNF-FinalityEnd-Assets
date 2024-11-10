function onEvent(eventName)
    if eventName == 'noteSpread' then
	    for i = 0, 3 do
	        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i] - getRandomInt(-50, screenWidth / 7))
	    	setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] - getRandomInt(5, screenHeight / 11))

	    	setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i] + getRandomInt(-50, screenWidth / 7))
	    	setPropertyFromGroup('opponentStrums', i, 'y',  _G['defaultOpponentStrumY'..i] - getRandomInt(5, screenHeight / 11))

            setPropertyFromGroup('playerStrums', i, 'angle', getRandomInt(-180, 180))
            setPropertyFromGroup('opponentStrums', i, 'angle', getRandomInt(-180, 180))

	    	noteTweenX('playerStrumsX'..i, i + 4, _G['defaultPlayerStrumX' .. i], (crochet/1000), 'circOut')
            noteTweenY('playerStrumsY'..i, i + 4, _G['defaultPlayerStrumY' .. i], (crochet/1000), 'circOut')
		
            noteTweenX('opponentStrumsX'..i, i, _G['defaultOpponentStrumX' .. i], (crochet/1000), 'circOut')
            noteTweenY('opponentStrumsY'..i, i, _G['defaultOpponentStrumY' .. i], (crochet/1000), 'circOut')

            noteTweenAngle('playerStrumsAngle'..i, i + 4, 0, (crochet/1000), 'circOut')
            noteTweenAngle('opponentStrumsAngle'..i, i, 0, (crochet/1000), 'circOut')
	    end
    end
end