ease = 'quadinout'
function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'x', -150)
        setPropertyFromGroup('playerStrums', i, 'x', 406 + (116 * i))
        originXNote0 = getPropertyFromGroup("opponentStrums", 0, 'x')
        originXNote1 = getPropertyFromGroup("opponentStrums", 1, 'x')
        originXNote2 = getPropertyFromGroup("opponentStrums", 2, 'x')
        originXNote3 = getPropertyFromGroup("opponentStrums", 3, 'x')
    end
end
function onEvent(n, v1, v2)
    if n == 'lmao' then
        if v1 == '1' then
            for i = 0,3 do
                noteTweenAlpha("noteAlpha"..i, i, 0.2, 1, 'quadin')
                noteTweenX("note0", 0, getPropertyFromGroup("playerStrums", 0, 'x'), v2, ease)
                noteTweenX("note1", 1, getPropertyFromGroup("playerStrums", 1, 'x'), v2, ease)
                noteTweenX("note2", 2, getPropertyFromGroup("playerStrums", 2, 'x'), v2, ease)
                noteTweenX("note3", 3, getPropertyFromGroup("playerStrums", 3, 'x'), v2, ease)
            end
        elseif v1 == '0' then
            for i = 0,3 do
                noteTweenAlpha("noteAlpha"..i, i, 1, 1, 'quadin')
                noteTweenX("note0", 0, originXNote0, v2, ease)
                noteTweenX("note1", 1, originXNote1, v2, ease)
                noteTweenX("note2", 2, originXNote2, v2, ease)
                noteTweenX("note3", 3, originXNote3, v2, ease)
            end
        elseif v1 == '2' then
            for i = 0, 7 do
                noteTweenAlpha("noteAlpha"..i, i, 0, v2, "quadin")
            end
        end
    end
end