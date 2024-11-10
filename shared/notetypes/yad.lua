local Time = 3
local Strength = 0.0008
local Bleeding = false

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'yad' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/yad')
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
            setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0)
            setPropertyFromGroup('unspawnNotes', i, 'ratingDisabled', true)
            setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true)
        end
        
    end
end
function goodNoteHit(i, d, t, s)
    if t == 'yad' and not s then
        Bleeding = true
        runTimer("toxicTime", Time)        
    end
end
function onUpdatePost(elapsed)
    if Bleeding then
        addHealth(-Strength)
        setProperty('healthGain', 0)   
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'toxicTime' then
        Bleeding = false
        setProperty('healthGain', 1)
    end
end