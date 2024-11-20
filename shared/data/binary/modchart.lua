dofile('assets/shared/data/binary/modchart.helper.lua')

function onCreate()
    if getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') == true then
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false);
    end
end

function onCreatePost()
    setProperty('cpuControlled', false);
end

function onSongStart()
    setProperty('songLength', 60*1000);

    setProperty('camZooming', true);

    print(getPropertyFromClass('flixel.FlxG', 'sound.music.length'));
end

local curOppoStrumX = {0, 0, 0, 0};
local hisLaughed = false;

function onStepHit()
    if curStep == 416 then
        dad.NoteTweenAlpha(.001, .4, 'cubeOut');
        bf.NoteTweenX(-315, 0.4, 'cubeOut');

        if not downscroll then
            bf.NoteTweenY(100, 0.4 ,'cubeOut');
        else
            bf.NoteTweenY(-100, 0.4 ,'cubeOut');
        end

        for i=0,3 do
            local curStrumX = _G['defaultOpponentStrumX'..i];
            noteTweenY('oppoY-'..i, i, curStrumX + (6*i), 0.4, 'quadInOut');
            noteTweenAngle('oppoAg-'..i, i, 90 - math.tan(math.pi * i), 0.8);
            curOppoStrumX = {curStrumX + (6*i),  curStrumX + (6*i),  curStrumX + (6*i),  curStrumX + (6*i)};
        end
    elseif curStep == 544 then
        bf.NoteTweenY(0, 0.4, 'cubeOut');
        bf.NoteTweenX(0, 0.4, 'cubeOut');
    elseif curStep == 556 then
        dad.NoteTweenAlpha(1, .8, 'cubeOut');

        for i=0,3 do
            cancelTween('oppoAg-'..i);

            noteTweenAngle('oppoAg-'..i, i, 0, 0.8);
            noteTweenY('oppoY-'..i, i, _G['defaultOpponentStrumY'..i], .5, 'quadInOut');
        end
    elseif curStep == 560 then
        dad.NoteTweenAlpha(.001, .4, 'cubeOut');
        bf.NoteTweenAlpha(.4, .4, 'cubeOut');

        hisLaughed = true;

        for i=1,8 do
            cancelTween('NOTEMOVE'..i);
        end

        for i=0,3 do
            cancelTween('oppoY-'..i);
            cancelTween('oppoAg-'..i);
            noteTweenAngle('oppoAg-'..i, i, 90 + math.tan(math.pi * i), 0.8);
            noteTweenY('oppoY-'..i, i, _G['defaultOpponentStrumX'..i] + (15*i), 0.4, 'quadInOut');
        end
    elseif curStep == 656 then
        bf.NoteTweenX(-315, 0.4, 'cubeOut');
        bf.NoteTweenAngle(360, 0.4, 'quadOut');

        bf_settings.__sin_p = -5;
        bf_settings.__sin_dur = 10;
        bf_settings.__sin_mult = .25;
    elseif curStep == 688 then
        bf.NoteTweenAlpha(1, 0.4, 'quadOut');

        bf_settings.__sin_p = -10;
        bf_settings.__sin_dur = 20;
        bf_settings.__sin_mult = .4;
        bf.SetDownScroll();

        if downscroll then
            bf.NoteTweenY(-500, 0.4, 'cubeOut');
        else
            bf.NoteTweenY(500, 0.4, 'cubeOut');
        end

        bf.NoteTweenAngle(0, 0.4, 'quadOut');
    end

    if curStep == 760 or curStep == 824 then
        if downscroll then
            bf.NoteTweenY(-400, 0.01, 'linear');
        else
            bf.NoteTweenY(400, 0.01, 'linear');
        end

        bf.NoteTweenAngle(180, 0.01, 'linear');

        runTimer('returnlol1', 0.011);
    elseif curStep == 764 or curStep == 828 then
        if downscroll  then
            bf.NoteTweenY(-400, 0.01, 'linear');
        else
            bf.NoteTweenY(400, 0.01, 'linear');
        end

        bf.NoteTweenAngle(-180, 0.01, 'linear');

        runTimer('returnlol1', 0.011);
    end

    if curStep == 784 then
        bf.NoteTweenX(-600, 0.4, 'cubeOut');
        bf.NoteTweenAngle(180, 0.01, 'linear');

        runTimer('returnlol2', 0.011);
        runTimer('fullscreennote', 0.4);
    end

    if curStep == 844 then
        bf.SetSettingsToDefault();

        bf.NoteTweenY(0, 0.4, 'cubeInOut');
        bf.NoteTweenX(-315, 0.4, 'cubeInOut');

        dad.NoteTweenAngle(0, 0.4, 'cubeInOut');
        dad.NoteTweenY(0, 0.4, 'cubeInOut');
        dad.NoteTweenX(325, 0.4, 'cubeInOut');
    elseif curStep == 848 then
        bf.SetUpScroll();

        bf.NoteTweenAngle(180, 0.01, 'linear');
        runTimer('returnlol2', 0.011);

        for i=0,2 do
            noteTweenAlpha('notea-'..i, i, 1, 0.4, 'quadOut');
        end
        noteTweenAlpha('notea-3', 3, 1, 1.4, 'quadOut');

        for i=4,6 do
            noteTweenAlpha('notsea-'..i, i, .001, 0.4, 'quadOut');
        end
        noteTweenAlpha('notsea-7', 7, .001, 1.4, 'quadOut');
    elseif curStep == 896 then
        bf_settings.pop_hit = true;

        for i=0,2 do
            noteTweenAlpha('notea-'..i, i, .001, 1.75, 'quadOut');
        end
        noteTweenAlpha('notea-3', 3, .001, 0.95, 'quadOut');

        for i=4,6 do
            noteTweenAlpha('notsea-'..i, i, 1, .95, 'quadOut');
        end
        noteTweenAlpha('notsea-7', 7, 1, 1.75, 'quadOut');
    end

    if curStep == 976 then
        bf_settings.pop_hit = false;
        bf.SetSettingsToDefault();

        bf.SetDownScroll();

        if downscroll then
            bf.NoteTweenY(-500, 0.4, 'quadInOut');
        else
            bf.NoteTweenY(500, 0.4, 'quadInOut');
        end

        bf.NoteTweenX(-315, 0.4, 'cubeInOut');
        bf.NoteTweenAngle(180, 0.01, 'linear');

        runTimer('returnlol2', 0.011);
    end

    --FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

    if curStep == 1004 or curStep == 1006 then
        bf.SetUpScroll();

        if downscroll then
            bf.NoteTweenY(-500, 0.1, 'cubeOut');
        else
            bf.NoteTweenY(500, 0.1, 'cubeOut');
        end

        bf.NoteTweenAngle(180, 0.01, 'linear');
        runTimer('returnlol2', 0.011);
    end

    --WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

    if curStep == 1141 or curStep == 1161 or curStep == 1163 or curStep == 1165 or curStep == 1167 or curStep == 1004 or curStep == 1006 or curStep == 1022 or curStep == 1034 or curStep == 1036 or curStep == 1038 then
        bf.SetUpScroll();

        bf.NoteTweenY(0, 0.1, 'cubeOut');
        bf.NoteTweenAngle(180, 0.01, 'linear');
        runTimer('returnlol2', 0.011);
    end

    if curStep == 1140 or curStep == 1160 or curStep == 1162 or curStep == 1164 or curStep == 1166 or curStep == 1005 or curStep == 1007 or curStep == 1023 or curStep == 1035 or curStep == 1037 or curStep == 1039 then
        bf.SetDownScroll();

        if downscroll then
            bf.NoteTweenY(-500, 0.1, 'cubeOut');
        else
            bf.NoteTweenY(500, 0.1, 'cubeOut');
        end

        bf.NoteTweenAngle(-180, 0.01, 'linear');

        cancelTimer('returnlol2');
        runTimer('returnlol2', 0.011);
    end

    if curStep == 1068 then
        if downscroll then
            noteTweenY('bffy-4', 5, 125, 0.01, 'cubeOut');
        else
            noteTweenY('bffy-4', 5, 425, 0.01, 'cubeOut');
        end

        runTimer('bffy22', 0.02);
    elseif curStep == 1069 then
        if downscroll then
            noteTweenY('bffy-6', 7, 125, 0.01, 'cubeOut');
        else
            noteTweenY('bffy-6', 7, 425, 0.01, 'cubeOut');
        end

        runTimer('bffy23', 0.02);
    end

    if curSpte == 1096 then
        bf.NoteTweenY(0, 2, 'cubeInOut');
    end

    if curStep >= 1096 and curStep <= 1104 then
        if curStep % 1 == 0 then
            popinY = popinY + 7;

            bf_settings.__cos_p = math.cos(7 + (popinY/2) * 1.2 + 5) * math.pi;
            bf_settings.__cos_dur = 4 + popinY/2 + 2.5;
            bf_settings.__cos_mult = 2 * 1.2 * popinY;

            bf_settings.__sin_p = math.sin(7 + (popinY/2) * 1.2 + 5) * math.pi;
            bf_settings.__sin_dur = 2+  popinY/2 + 2.5;
            bf_settings.__sin_mult = 1.7 * 1.2 * popinY;
        end
    elseif curStep == 1105 then
        popinY = 0;

        bf.SetSettingsToDefault();
        bf.SetUpScroll();
        bf.NoteTweenY(0, 0.001, 'linear');

        noteTweenAngle("noea", 5, 720, 2, 'cubeOut');
    elseif curStep == 1112 then
        noteTweenAngle('noe2', 4, 720, 1.5, 'cubeOut');
    elseif curStep == 1120 then
        cancelTween('noea');
        cancelTween('noe2');

        noteTweenAngle('noea', 5, 0, 0.001, 'cubeOut');
        noteTweenAngle('noe2', 4, 0, 0.001, 'cubeOut');
    elseif curStep == 1168 then
        tweening = true;

        noteTweenX('n14', 4, 40, 10, 'quadInOut');
        noteTweenX('n15', 5, 325, 10, 'quadInOut');
        noteTweenX('n16', 6, 784, 10, 'quadInOut');
        noteTweenX('n17', 7, 1100, 10, 'quadInOut');

        noteTweenY('no24', 4, defaultPlayerStrumY0 + 45, 1, 'quadInOut');
        noteTweenY('no25', 5, defaultPlayerStrumY1 - 45, 1, 'quadInOut');
        noteTweenY('no26', 6, defaultPlayerStrumY2 + 45, 1, 'quadInOut');
        noteTweenY('no27', 7, defaultPlayerStrumY3 - 45, 1, 'quadInOut');
    elseif curStep == 1224 then
        tweening = false;

        for i=4,7 do
            cancelTween('no2'..i);
            cancelTween('no4'..i);

            cancelTween('n1'..i);
        end

        bf.NoteTweenX(-315, 0.15, 'cubeOut');
        bf.NoteTweenY(0, 0.15, 'cubeOut');
    elseif curStep == 1226 then
        bf.NoteTweenX(getRandomFloat(-600, 50), 0.01, 'cubeOut');
    elseif curStep == 1227 then
        bf.NoteTweenX(getRandomFloat(-600, 50), 0.01, 'cubeOut');
    elseif curStep == 1228 then
        bf.NoteTweenX(getRandomFloat(-600, 50), 0.01, 'cubeOut');

        noteTweenAlpha('nrer3', 7, .001, 0.2, 'quadOut');
    elseif curStep == 1230 then
        noteTweenAlpha('nrer4', 4, .001, 0.2, 'quadOut');
    elseif curStep == 1264 then
        bf.NoteTweenX(-315, 0.001, 'quadOut');

        if downscroll then
            setPropertyFromGroup('strumLineNotes', 4, 'downScroll', false);
            setPropertyFromGroup('strumLineNotes', 5, 'downScroll', true);
            setPropertyFromGroup('strumLineNotes', 6, 'downScroll', true);
            setPropertyFromGroup('strumLineNotes', 7, 'downScroll', false);
        else
            setPropertyFromGroup('strumLineNotes', 4, 'downScroll', true);
            setPropertyFromGroup('strumLineNotes', 5, 'downScroll', false);
            setPropertyFromGroup('strumLineNotes', 6, 'downScroll', false);
            setPropertyFromGroup('strumLineNotes', 7, 'downScroll', true);
        end

        noteTweenAngle('lol1', 4, 45, 0.001, 'quadOut');
        noteTweenAngle('lol2', 5, 15, 0.001, 'quadOut');
        noteTweenAngle('lol3', 6, 165, 0.001, 'quadOut');
        noteTweenAngle('lol4', 7, -45, 0.001, 'quadOut');

        noteTweenY('etetet1', 4, 375, .01, 'quadOut');
        noteTweenY('etetet2', 7, 375, .01, 'quadOut');
        noteTweenY('etetet3', 5, 295, .01, 'quadOut');
        noteTweenY('etetet4', 6, 295, .01, 'quadOut');

        bf_settings.__sin_p = 10;
        bf_settings.__sin_dur = 40;
        bf_settings.__sin_mult = .35;

        bf_settings.__cos_p = 15;
        bf_settings.__cos_dur = 75;
        bf_settings.__cos_mult = .25;

        bf_settings.hard_shit_moment = true;
    elseif curStep == 1408 then
        bf.NoteTweenAlpha(1, 1, 'cubeInOut');
    elseif curStep == 1544 then
        bf_settings.hard_shit_moment = false;

        bf.NoteTweenY(0, 0.85, 'cubeInOut');
        bf.NoteTweenAngle(0, 0.85, 'cubeInOut');
        bf.NoteTweenX(-315, 0.85, 'cubeInOut');
    elseif curStep == 1546 then
        noteTweenAlpha('dadad1', 0, 1, 0.2, 'quadOut');
        noteTweenAlpha('dadad2', 1, 1, 4, 'quadOut');
        noteTweenAlpha('dadad3', 2, 1, 0.2, 'quadOut');
        noteTweenAlpha('dadad4', 3, 1, 4, 'quadOut');

        noteTweenAlpha('rerer11', 4, .001, 0.2, 'quadOut');
    elseif curStep == 1551 then
        noteTweenAlpha('rerer12', 6, .001, 0.2, 'quadOut');
    elseif curStep == 1552 then
        bf.SetUpScroll();
        bf.SetSettingsToDefault();
    elseif curStep == 1560 then
        noteTweenAlpha('rerer13', 5, .001, 0.2, 'quadOut');
        noteTweenAlpha('rerer14', 7, .001, 0.2, 'quadOut');
    elseif curStep == 1672 then
        bf.NoteTweenAlpha(1, 1, 'quadInOut');

        dad.NoteTweenX(0, 1, 'cubeInOut');
        bf.NoteTweenX(0, 1, 'cubeInOut');
    elseif curStep == 1796 then
        noteTweenAlpha('af321', 3, .001, 1.35, 'quadInOut');
        noteTweenAlpha('af323', 7, .001, 1.35, 'quadInOut');
    elseif curStep == 1800 then
        noteTweenAlpha('af3234', 1, .001, .95, 'quadInOut');
        noteTweenAlpha('af3232', 5, .001, .95, 'quadInOut');
    elseif curStep == 1804 then
        noteTweenAlpha('af3236', 2, .001, .65, 'quadInOut');
        noteTweenAlpha('af3231', 6, .001, .65, 'quadInOut');
    end

    if curStep == 1808 then
        if downscroll then
            all.NoteTweenY(-500, 3, 'cubeIn');
        else
            all.NoteTweenY(500, 3, 'cubeIn');
        end

        noteTweenAlpha('af302', 0, .001, 1.85, 'quadInOut');
        noteTweenAlpha('af303', 4, .001, 1.85, 'quadInOut');
    end
end

tweening = false;

function onTweenCompleted(t)
    if tweening then
        if t == 'no24' then
            noteTweenY('no34', 4, defaultPlayerStrumY0 - 45, 1, 'quadInOut');
        elseif t == 'no34' then
            noteTweenY('no24', 4, defaultPlayerStrumY0 + 45, 1, 'quadInOut');
        end

        if t == 'no25' then
            noteTweenY('no35', 5, defaultPlayerStrumY1 + 45, 1, 'quadInOut');
        elseif t == 'no35' then
            noteTweenY('no25', 5, defaultPlayerStrumY1 - 45, 1, 'quadInOut');
        end

        if t == 'no24' then
            noteTweenY('no36', 6, defaultPlayerStrumY2 - 45, 1, 'quadInOut');
        elseif t == 'no34' then
            noteTweenY('no26', 6, defaultPlayerStrumY2 + 45, 1, 'quadInOut');
        end

        if t == 'no24' then
            noteTweenY('no37', 7, defaultPlayerStrumY3 + 45, 1, 'quadInOut');
        elseif t == 'no34' then
            noteTweenY('no27', 7, defaultPlayerStrumY3 - 45, 1, 'quadInOut');
        end
    end
end

function onTimerCompleted(t)
    if t == 'returnlol1' then
        bf.NoteTweenAngle(0, 0.4, 'quadOut');

        if downscroll then
            bf.NoteTweenY(-500, 0.4, 'cubeOut');
        else
            bf.NoteTweenY(500, 0.4, 'cubeOut');
        end
    end

    if t == 'returnlol2' then
        bf.NoteTweenAngle(0, 0.4, 'quadOut');
    end

    if t == 'fullscreennote' then
        noteTweenX('bffx-4', 4, 50, 4.25, 'quadInOut')
        noteTweenX('bffx-5', 5, 489, 4.25, 'quadInOut')
        noteTweenX('bffx-6', 6, 812, 4.25, 'quadInOut')
        noteTweenX('bffx-7', 7, 1125, 4.25, 'quadInOut')
    end

    if t == 'bffy22' then
        if downscroll then
            noteTweenY('bffy-4', 5, 100, 0.25, 'quadInOut');
        else
            noteTweenY('bffy-4', 5, 565, 0.25, 'quadInOut');
        end
    end

    if t == 'bffy23' then
        if downscroll then
            noteTweenY('bffy-6', 7, 100, 0.25, 'quadInOut');
        else
            noteTweenY('bffy-6', 7, 535, 0.25, 'quadInOut');
        end
    end

    if t == 'bffy25' then
        if downscroll then
            noteTweenY('bffy-5', 6, 100, 0.25, 'quadInOut');
        else
            noteTweenY('bffy-5', 6, 550, 0.25, 'quadInOut');
        end
    end
end

local aTimer = 0;
local popinY = 0;

function onUpdatePost(e)
    local songPos = getPropertyFromClass('psych.backend.Conductor', 'songPosition');
    local currentBeat = (songPos / 1000) * (bpm / 60);

    bf.UpdateNote(currentBeat);

    if songPos >= 98480 and songPos <= 98520 then
        if downscroll then
            noteTweenY('bffy-5', 6, 125, 0.01, 'cubeOut');
        else
            noteTweenY('bffy-5', 6, 425, 0.01, 'cubeOut');
        end

        runTimer('bffy25', 0.02);
    elseif songPos >= 112380 and songPos <= 112420 then
        bf.NoteTweenX(getRandomFloat(-600, 50), 0.01, 'cubeOut');

        noteTweenAlpha('nrer1', 5, .001, 0.2, 'quadOut');
    elseif songPos >= 112430 and songPos <= 112500 then
        bf.NoteTweenX(getRandomFloat(-600, 50), 0.01, 'cubeOut');

        noteTweenAlpha('nrer2', 6, .001, 0.2, 'quadOut');
    end
end

function goodNoteHit(id, dir, nt, isSus)
    if not isSus then
        if (bf_settings.pop_hit) then
            popinY = popinY + 1.25;

            bf_settings.__cos_p = math.cos(7 + (popinY/2) * 1.2 + 5) * math.pi;
            bf_settings.__cos_dur = 4 + popinY/2 + 2.5;
            bf_settings.__cos_mult = 2 * 1.2 * popinY;

            bf_settings.__sin_p = math.sin(7 + (popinY/2) * 1.2 + 5) * math.pi;
            bf_settings.__sin_dur = 2+  popinY/2 + 2.5;
            bf_settings.__sin_mult = 1.7 * 1.2 * popinY;
        end

        if (bf_settings.hard_shit_moment) then
            --players must hit this section's lol (i died in this moment LOL :D) -mrzk
            setProperty('health', getProperty('health') + .075);

            if not ghostTapping then
                setProperty('health', getProperty('health') + .025);
            end

            bf_settings.__cos_p = bf_settings.__cos_p + getRandomFloat(.7, 1.6);
            bf_settings.__cos_dur = bf_settings.__cos_dur + getRandomFloat(2.1, 4);
            bf_settings.__cos_mult = bf_settings.__cos_mult + getRandomFloat(.4, .7);

            bf_settings.__sin_p = bf_settings.__sin_p + getRandomFloat(.7, 1.6);
            bf_settings.__sin_dur = bf_settings.__sin_dur + getRandomFloat(2.1, 4);
            bf_settings.__sin_mult = bf_settings.__sin_mult + getRandomFloat(.4, .7);
        end
    end
end

function opponentNoteHit(id, dir, nt, isSus)
    if hisLaughed and not isSus then
        if getProperty('health') > 0.2 then
            if (bf_settings.hard_shit_moment) then
                if ghostTapping then
                    setProperty('health', getProperty('health') - .01);
                else
                    setProperty('health', getProperty('health') - .005);
                end
            else
                if ghostTapping then
                    setProperty('health', getProperty('health') - .04);
                else
                    setProperty('health', getProperty('health') - .02);
                end
            end
        end
    end
end
