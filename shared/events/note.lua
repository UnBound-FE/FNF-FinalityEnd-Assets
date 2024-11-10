local eTime = 0
local speed = 1.8
local distance = 160
local enabled = false
local ease = 'sineout'
function onCreatePost()
    for i = 0, 3 do
        originXNote0 = getPropertyFromGroup("playerStrums", 0, 'x')
        originXNote1 = getPropertyFromGroup("playerStrums", 1, 'x')
        originXNote2 = getPropertyFromGroup("playerStrums", 2, 'x')
        originXNote3 = getPropertyFromGroup("playerStrums", 3, 'x')
    end
end
function onEvent(n, v1, v2)
    if n == 'note' then
        val2 = stringSplit(v2, ',')
        speed = val2[1]
        distance = val2[2]
        if v1 == 'on' then            
            enabled = true
        elseif v1 == 'off' then
            enabled = false
            noteTweenX("note0", 4, originXNote0, speed, ease)
            noteTweenX("note1", 5, originXNote1, speed, ease)
            noteTweenX("note2", 6, originXNote2, speed, ease)
            noteTweenX("note3", 7, originXNote3, speed, ease)
        end
    end
end
function onUpdatePost(e)
    eTime = eTime + e
    if enabled then
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'x', originXNote0 + (math.sin(eTime * speed) * distance) + (112 * i))
        end
    end
end