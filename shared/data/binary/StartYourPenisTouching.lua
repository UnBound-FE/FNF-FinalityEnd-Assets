videoMP4 = 'cut1'; --вставь видео.mp4 (1280x720)
clickSound = 'confirmMenu'; --звук enter'a
soundVolume = 1.0;
imagePNG = 'touchYourPenis2'; --превью предупреждения
textSettings = {
    x = 325,
    y = 595,
    size = 32
}
local allowCountdown = false;
local clickEnter = false;

function onCreate()
    addHaxeLibrary('FlxFlicker', 'flixel.effects');
end

function onStartCountdown()
    if not allowCountdown then
        doTweenAlpha('blackTween', 'blackfuck', .001, 1, 'quadInOut');
        doTweenAlpha('textTween', 'pressTxt', 1.0, 2, 'quadInOut');

        clickEnter = true;

        return Function_Stop;
    end

    return Function_Continue;
end

function onCreate()
    if not allowCountdown then
        makeLuaSprite('preview', imagePNG, 0, 0);
        setObjectCamera('preview', 'camOther');
        setGraphicSize('preview', screenWidth, screenHeight);
        addLuaSprite('preview', true);

        makeLuaSprite('blackfuck');
        makeGraphic('blackfuck', screenWidth, screenHeight, '000000');
        setObjectCamera('blackfuck', 'camOther');
        addLuaSprite('blackfuck', true);

        makeLuaText('pressTxt','Press Enter to Begin',1000,textSettings.x,textSettings.y)
        setTextFont('pressTxt','vcr.ttf')
        setTextSize('pressTxt',textSettings.size);
        setProperty('pressTxt.alpha',.001)
        setObjectCamera('pressTxt','camOther')
        addLuaText('pressTxt',true)
    end
end

function onUpdatePost(el)
    if clickEnter then
        if getPropertyFromClass('flixel.FlxG','keys.justPressed.ENTER') then
            playSound(clickSound, soundVolume);

            clickEnter = false;
            seenCutscene = true;

            cancelTween('textTween');
            cancelTween('text2Tween');
            cancelTween('blackTween');

            setProperty('pressTxt.alpha', 1.0);

            doTweenAlpha('blackTween2', 'blackfuck', 1.0, 0.6, 'quadInOut');

            runHaxeCode([[
                FlxFlicker.flicker(game.getLuaObject('pressTxt', true), 1, 0.06, false, false);
            ]])

            runTimer('startSong', 0.6);
        end
    end
end

function onSongStart()
    doTweenAlpha('blackTween', 'blackfuck', .001, 0.4);
end

function onTimerCompleted(t)
    if t == 'startSong' then
        allowCountdown = true;
        startCountdown();
    end
end

function onTweenCompleted(t)
    if t == 'textTween' then
        doTweenAlpha('text2Tween', 'pressTxt', .001, 2, 'quadInOut');
    elseif t == 'text2Tween' then
        doTweenAlpha('textTween', 'pressTxt', 1.0, 2, 'quadInOut');
    end

    if t == 'blackTween2' then
        removeLuaSprite('preview');
    end
end
