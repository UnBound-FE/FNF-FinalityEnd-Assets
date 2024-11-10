function onCreatePost()
	for i=0,3 do 
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.00001)
		setPropertyFromGroup('playerStrums', i, 'alpha', 0.00001)
    end
end

function onStepHit()
	if curStep == 1 then
		noteTweenAlpha('noteFadeIn0', 0, 1, 0.5, 'quadInOut')
	end
	if curStep == 16 then
		noteTweenAlpha('noteFadeIn1', 1, 1, 0.5, 'quadInOut')
	end
	if curStep == 32 then
		noteTweenAlpha('noteFadeIn2', 2, 1, 0.5, 'quadInOut')
	end
	if curStep == 48 then
		noteTweenAlpha('noteFadeIn3', 3, 1, 0.5, 'quadInOut')
	end
	if curStep == 64 then
		noteTweenAlpha('noteFadeIn7', 7, 1, 0.5, 'quadInOut')
	end
	if curStep == 80 then
		noteTweenAlpha('noteFadeIn6', 6, 1, 0.5, 'quadInOut')
	end
	if curStep == 96 then
		noteTweenAlpha('noteFadeIn5', 5, 1, 0.5, 'quadInOut')
	end
	if curStep == 112 then
		noteTweenAlpha('noteFadeIn3', 4, 1, 0.5, 'quadInOut')
	end
end