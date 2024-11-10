function onCreate()
    if getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') == true then
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false);
    end
end

function onSongStart()
    setProperty('songLength', 60*1000);
end

laughted = false;
noteAct = 0;
addingStrumY = 1;
normalized = false;
startWOWOA = false;
startHexCodeLmao = false;
globalNormalizing = false;
fixThisShit = false;
angleYes = false;

function onStepHit()
    if curStep == 560 then
        runHaxeCode([[
            FlxTween.tween(game, {songLength: FlxG.sound.music.length}, 9, {ease: FlxEase.cubeInOut});
            FlxTween.tween(game, {health: 1}, 9, {ease: FlxEase.cubeInOut});
        ]])
    end

    if curStep == 646 then
        laughted = true;

        doTweenAlpha('time1','timeBar',.001,1,'quadOut');
        doTweenAlpha('time2','timeTxt',.001,1,'quadOut');

        cameraFlash('camOther', 'ffffff', 1);
    end

    if curStep == 678 then
        noteAct = 1;

        enemyNoteTweenAlpha(.001, 0.9, 'cubeOut');

        bfNoteTweenX(-60, 0.9, 'quadInOut');

        for i=0,3 do
            noteTweenY('oppoY-'..i, i, _G['defaultOpponentStrumY'..i] + 100, i*2, 'circOut');
        end
    end

    if curStep == 710 then
        noteAct = 2;

        allNoteAngle(360, 0.7, 'quadInOut');

        addingStrumY = 1.25;
    elseif curStep == 837 then
        normalized = true;
        noteAct = 3;

        allNoteAngle(-360, 0.7, 'quadInOut');

        addingStrumY = 1.5;

        enemyNoteTweenAlpha(0.6, 1, 'quadInOut');

        for i=0,3 do
            cancelTween('oppoa-'..i);

            noteTweenX('oppoX-'..i, i, (i*187) + 325 - 27.5, 0.7, 'cubeOut');
            noteTweenY('oppoY-'..i, i, _G['defaultOpponentStrumY'..i]-10, 0.7, 'circOut');
        end

        for i=4,7 do
            noteTweenX('befeX-'..i, i, (i*187) - 425 - 27.5, 0.7, 'cubeOut');

            noteTweenY('befeY-'..i, i, _G['defaultOpponentStrumY'..(i-4)]-10, 0.7, 'circOut');
        end

        fixThisShit = true;
    elseif curStep == 901 then
        enemyNoteTweenAlpha(.001, 0.7, 'cubeOut');
    elseif curStep == 964 then
        fixThisShit = false;

        noteAct = 4;
        allNoteAngle(360, 0.7, 'quadInOut');
        bfNoteTweenX(-60, 0.7, 'quadInOut');
        
    elseif curStep == 1219 then
        for i=4,7 do
            noteTweenAlpha('oommgaa'..i, i, 0.001, 1, 'quadInOut');
        end
    elseif curStep == 1240 then
        allNoteAngle(0, 0.1, 'quadOut');
        for i=4,7 do
            noteTweenX('xnote-'..i, i, (i*112) - 30, 0.1, 'cubeOut');
            if downscroll then
                noteTweenY('ynote-'..i, i, 515, 0.1, 'quadIn');
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true);
            else
                noteTweenY('ynote-'..i, i, 72, 0.1, 'quadIn');
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false);
            end
        end
    elseif curStep == 1280 then
        for i=4,7 do
            noteTweenAlpha('oommgaa'..i, i, 1, 1, 'quadOut');
        end
    elseif curStep == 1283 then
        noteAct = 6;

        allNoteAngle(360, 0.7, 'quadOut');
        startHexCodeLmao = true;
        for i=4,7 do
            if downscroll then
                noteTweenY('ynote-'..i, i, 515, 0.25, 'quadInOut');
            else
                noteTweenY('ynote-'..i, i, 75, 0.25, 'quadInOut');
            end
            noteTweenX('xnote-'..i, i, (i*180) - 385, 0.7, 'cubeOut');
        end
    end

    
    if curStep == 1539 then
        globalNormalizing = true;
        allNoteAngle(0, 0.7, 'quadInOut');

        for i=4,7 do
            if downscroll then
                noteTweenY('ynote-'..i, i, 560, 0.7, 'quadInOut');
            else
                noteTweenY('ynote-'..i, i, 50, 0.7, 'quadInOut');
            end

            noteTweenX('xnote-'..i, i, (i*112) - 30, 0.7, 'quadInOut');
        end
    end

    if curStep == 1600 then
        angleYes = true;
    end

    if curStep == 1793 then
        angleYes = false;

        for i=0,7 do
            noteTweenX('xnote-'..i, i, (i*112) - 30, 0.4, 'quadInOut');

            noteTweenAlpha('alphaa'..i, i, 0, 1.7, 'quadInOut');

            if downscroll then
                noteTweenY('tetete'..i, i, 0, 4, 'cubeInOut');
            else
                noteTweenY('tetete'..i, i, 720, 4, 'cubeInOut');
            end
        end
    end
end

function onTimerCompleted(t)
    if t == 'downscrolling' then
        if downscroll then
            for i=0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false);
            end
        else
            for i=0,7 do
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true);
            end
        end
    end
end

notePlus = 0.0;
noteee = 0.0;

function onUpdate(e)
    local songPos = getPropertyFromClass('backend.Conductor', 'songPosition');
    local currentBeat = (songPos / 1000)*(bpm/60);

    if globalNormalizing and angleYes then
        for i=0,3 do
            setProperty('playerStrums.members['..i..'].x', getProperty('playerStrums.members['..i..'].x') + notePlus * math.cos((currentBeat+i*noteee)));
        end
    end

    if not globalNormalizing then
        if laughted and noteAct < 3 then
            for i=0,3 do
                setProperty('opponentStrums.members['..i..'].y', 
                getProperty('opponentStrums.members['..i..'].y') - 5*addingStrumY * math.cos((currentBeat + i*0.25)*addingStrumY * math.pi) / 8.5);
            end
    
            for i=0,3 do
                setProperty('playerStrums.members['..i..'].y', 
                getProperty('playerStrums.members['..i..'].y') - 5*addingStrumY * math.cos((currentBeat + i*0.25)*addingStrumY * math.pi) / 8.5);
            end
        end
    
        if noteAct == 3 and normalized then
            for i=0,3 do
                setProperty('opponentStrums.members['..i..'].y', 45);
            end
    
            for i=0,3 do
                setProperty('playerStrums.members['..i..'].y', 45);
            end
    
            normalized = false;
        end
    
        if startWOWOA and noteAct == 5 then
            for i=0,3 do
                setProperty('playerStrums.members['..i..'].x', getProperty('playerStrums.members['..i..'].x') + 1 * math.cos((currentBeat+i*0.25)*math.pi));
            end
        end
    
        local altCurBeat = (songPos/1000)*(bpm/60);
    
        if startHexCodeLmao and noteAct == 6 then
            for i=0,3 do
                setProperty('playerStrums.members['..i..'].x', getProperty('playerStrums.members['..i..'].x') + e - 2 * math.sin((altCurBeat*0.4+(i*2))*math.pi));
                setProperty('playerStrums.members['..i..'].y', 
                getProperty('playerStrums.members['..i..'].y') + 2.1 * math.sin((altCurBeat + i*0.7)*addingStrumY + (e-getRandomFloat(0.8,1.2)) * math.pi) / 7);
            end
        end
    end
end

function opponentNoteHit(id, dir, nt, isSus)
    if laughted and not globalNormalizing then
        if getHealth() > 0.15 then
            if not isSus then
                setHealth(getHealth() - (getRandomFloat(0.003, 0.01) / 1.3));
            else
                setHealth(getHealth() - (getRandomFloat(0.003, 0.01) / 3.1));
            end
         end
    end
end

function goodNoteHit(id, dir, nt, isSus)
    if not isSus and not globalNormalizing then
        if fixThisShit or noteAct == 6 then
            setProperty('playerStrums.members['..dir..'].y', getProperty('playerStrums.members['..dir..'].y') - 30);

            cancelTween('strumY-'..dir);
            doTweenY('strumY-'..dir, 'playerStrums.members['..dir..']', getProperty('playerStrums.members['..dir..'].y') + 30, 0.5, 'elasticOut');
        end
    end

    if not isSus then
        if globalNormalizing and angleYes then
            setProperty('playerStrums.members['..dir..'].angle', getRandomFloat(-30, 40));
            cancelTween('strumAA'..dir);
            doTweenAngle('strumAA'..dir, 'playerStrums.members['..dir..']', 0, 0.4, 'cubeOut');

            notePlus = notePlus + 0.02359375;
            noteee = noteee + 0.0087265;
        end
    end
end

function enemyNoteTweenX(value, duration, ease)
    for i=0,3 do
        noteTweenX('oppoX-'..i, i, _G['defaultOpponentStrumX'..i] + value, duration, ease);
    end
end

function enemyNoteTweenAlpha(value, duration, ease)
    for i=0,3 do
        cancelTween('oppoAl-'..i);
        noteTweenAlpha('oppoAl-'..i, i, value, duration, ease);
    end
end

function bfNoteTweenX(value, duration, ease)
    for i=4,7 do
        noteTweenX('bfX-'..i, i, (i*118) + value, duration, ease);
    end
end

function allNoteAngle(value, duration, ease)
    for i=0,7 do
        noteTweenAngle('noteAngle-'..i, i, value, duration, ease);
    end
end