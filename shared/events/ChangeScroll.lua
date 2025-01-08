-- script by JDaniel Aleatorio

function onEvent(eventName, value1)
    if eventName == 'ChangeScroll' then
        -- tween animations
        for i = 0, 7 do
            noteTweenY("NoteGoLikeCrazy"..i, i, (getPropertyFromGroup('opponentStrums',0,'downScroll')) and 50 or 570, tonumber(value1) + (i/20), "BounceOut")
        end

        -- other
        -- --- ---- playSound('troca', 2) ----- ------- PLACE YOUR SOUND HERE! (or not)
        runTimer('ChangeScrollNow', tonumber(value1)/4) -- the timer that change the scroll type or something
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ChangeScrollNow' then
        for i = 0, 4 do  -- set property thing
            setPropertyFromGroup('opponentStrums',i,'downScroll', not getPropertyFromGroup('opponentStrums',i,'downScroll'))
            setPropertyFromGroup('playerStrums',i,'downScroll', not getPropertyFromGroup('playerStrums',i,'downScroll'))
        end
    end
end
