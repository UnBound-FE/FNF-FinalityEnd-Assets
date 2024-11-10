function onUpdatePost()
	local currentBeat = (getSongPosition()/1000)*(curBpm/60)
    if curBeat >= 278 and curBeat < 976 then
        for i=0,3 do 
            setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] - 25 * math.sin((currentBeat + i*0.25) * math.pi))
			setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] - 25 * math.sin((currentBeat + (i+3)*0.25) * math.pi))
        end
    end
end