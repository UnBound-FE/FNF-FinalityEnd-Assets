function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'damagenote' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/damagenote_assets')
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
    if t == 'damagenote' and not s then
        addHealth(-0.25)
    end
end