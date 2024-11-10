function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'missnote' then
    setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/miss');
    setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
    if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
    end
    end
    end
    end
    
    function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'missnote' then
    health = getProperty('health') 
    setProperty('health', health- 0.2);
    end
    end