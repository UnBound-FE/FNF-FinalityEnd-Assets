-- CHANGE THE OFFSET VARIABLE FOR MORE OR LESS CAMERA MOVEMENT!!
local offset = 100
--
local function follow(data, mustPress, type)
	if type ~= "No Animation" and type ~= "Hey!" and type ~= "Hurt Note" and (gfSection or mustPress == nil or mustPress == mustHitSection) then
		local x, y = 0, 0
		if data ~= nil then
			if data == 0 then
				x = -offset
			elseif data == 1 then
				y = offset
			elseif data == 2 then
				y = -offset
			else
				x = offset
			end
			runTimer("coolCam", stepCrochet * (0.0011 / getPropertyFromClass("flixel.FlxG", "sound.music.pitch")) * getProperty((gfSection and "gf" or (mustPress and "boyfriend" or "dad")) .. ".singDuration"))
		else
			cancelTimer("coolCam")
		end
		setProperty("camGame.targetOffset.x", x)
		setProperty("camGame.targetOffset.y", y)
	end
end

videoMP4 = 'cut1';
clickSound = 'confirmMenu';
soundVolume = 1.0;
imagePNG = 'touchYourPenis2';
textSettings = {
    x = 325,
    y = 595,
    size = 32
}

local allowCountdown = false;
local videoStarted = false;
local clickEnter = false;

-- This script made by BillyLOLwkwk
-- dont ever change this variable from path to cooldown
local path = ''
local scale = 0
local boyX = 0
local boyY = 0
local flipX = false 
local anim = {}
local x = 0
local ofs = {}
local fps = {}
local cooldown = {false, false, false, false}

local SPI_SETDESKWALLPAPER = 0x0014
local SPIF_UPDATEINIFILE = 0x01

local HWND_TOPMOST = ffi.cast("HWND", -1)
local SWP_NOMOVE = 0x0002
local SWP_NOSIZE = 0x0001

-- you can change this one to custom it yourself
local shadow = true -- true if you want turn on the shadow and false if you want turn it off
local range = 50 -- for the shadow range
local duration = 1 -- for how long the shadow still

function startWith(text, prefix)
    return text:find(prefix,1,true) == 1
end

function updateShadow()
	-- don't be gay >:]
	path = getProperty('dad.imageFile')
	scale = getProperty('dad.jsonScale')
	boyX = getProperty('dad.x')
	boyY = getProperty('dad.y')
	flipX = getProperty('dad.originalFlipX') 
	for x = 0, getProperty('dad.animationsArray.length')-1 do
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singLEFT' then
			anim[1] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[1] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[2] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[1] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singDOWN' then
			anim[2] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[3] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[4] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[2] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singUP' then
			anim[3] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[5] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[6] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[3] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
		if getPropertyFromGroup('dad.animationsArray', x, 'anim') == 'singRIGHT' then
			anim[4] = getPropertyFromGroup('dad.animationsArray', x, 'name')
			ofs[7] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[1]
			ofs[8] = getPropertyFromGroup('dad.animationsArray', x, 'offsets')[2]
			fps[4] = getPropertyFromGroup('dad.animationsArray', x, 'fps')
		end
	end
end

local ffi = require("ffi")

ffi.cdef([[
    enum{
        COLOR_REF = 0x131313
    };

    typedef void* HWND;
    typedef int BOOL;

    typedef unsigned char BYTE;
    typedef unsigned long DWORD;
    typedef DWORD COLORREF;

    HWND GetActiveWindow();
    long SetWindowLongA(HWND hWnd, int nIndex, long dwNewLong);

    bool SetLayeredWindowAttributes(HWND hWnd, int crKey, BYTE bAlpha, int dwFlags);
    int GWL_EXSTYLE;
    int WS_EX_LAYERED;
    int LWA_ALPHA;
]])

local winSave = {
    x = 0,
    y = 0,
    fullscreen = false,
    maximized = false,
    width = 1280,
    height = 720,
    fullWidth = 0,
    fullHeight = 0
}

laughted = false;
noteAct = 0;
addingStrumY = 1;
normalized = false;
startWOWOA = false;
startHexCodeLmao = false;
globalNormalizing = false;
fixThisShit = false;
angleYes = false;

function onCreate()
    addHaxeLibrary('Lib', 'openfl')

    winSave.fullscreen = getPropertyFromClass('openfl.Lib', 'application.window.fullscreen')
    winSave.maximized = getPropertyFromClass('openfl.Lib', 'application.window.maximized')
    winSave.x = getPropertyFromClass('openfl.Lib', 'application.window.x')
    winSave.y = getPropertyFromClass('openfl.Lib', 'application.window.y')
    winSave.width = getPropertyFromClass('openfl.Lib', 'application.window.width')
    winSave.height = getPropertyFromClass('openfl.Lib', 'application.window.height')
    winSave.fullWidth = getPropertyFromClass("openfl.Lib", "application.window.display.bounds.width")
    winSave.fullHeight = getPropertyFromClass("openfl.Lib", "application.window.display.bounds.height")

    setVar('winX', winSave.x)
    setVar('winY', winSave.y)
    setVar('winW', winSave.width)
    setVar('winH', winSave.height)
    setVar('winSX', winSave.fullWidth)
    setVar('winSY', winSave.fullHeight)

    if shadersEnabled then
        makeLuaSprite("vigCamShader")
        makeLuaSprite("tvEffect")
        runHaxeCode([[
            var vignetteShader = "test5";
            var tvEffect = "test3";
            
            game.initLuaShader(vignetteShader);
            game.initLuaShader(tvEffect);
            
            var shader0 = game.createRuntimeShader(vignetteShader);
            var shader1 = game.createRuntimeShader(tvEffect);
            
            game.getLuaObject("vigCamShader").shader = shader0;
            game.getLuaObject("tvEffect").shader = shader1;

            game.camGame.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
            game.camHUD.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
            return;
        ]])
    end

    setProperty('skipCountdown', true);

    if getPropertyFromClass('backend.ClientPrefs', 'data.middleScroll') == true then
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false);
    end
end

function onSongStart()
    setProperty('songLength', 60*1000);

    doTweenAlpha('blackTween', 'blackfuck', .001, 0.4);
end

function onCreatePost()
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

	updateShadow()
end

function onUpdatePost(elapsed)
	local currentBeat = (getSongPosition()/1000)*(curBpm/60)
    if curBeat >= 273 and curBeat < 307 then
        for i=0,3 do 
            setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] - 25 * math.sin((currentBeat + i*0.25) * math.pi))
			setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] - 25 * math.sin((currentBeat + (i+3)*0.25) * math.pi))
        end
    end

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

function onUpdate(e)
    local songPos = getPropertyFromClass('backend.Conductor', 'songPosition');
    local currentBeat = (songPos / 1000)*(bpm/60);

    if shadersEnabled then
        setShaderFloat('tvEffect', 'iTime', os.clock())
    end

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

function goodNoteHit(_, data, type, isSus)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, true, type)
	end

    local dir = data;

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

function opponentNoteHit(_, data, type, isSus)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, false, type)
	end

    if laughted and not globalNormalizing then
        if getHealth() > 0.15 then
            if not isSus then
                setHealth(getHealth() - (getRandomFloat(0.003, 0.01) / 1.3));
            else
                setHealth(getHealth() - (getRandomFloat(0.003, 0.01) / 3.1));
            end
         end
    end

    local a = _;
    local b = data;
    local c = type;
    local d = isSus;

    if shadow and (d == false or (d == true and cooldown[b+1])) then
        local tag = 'shadowdad'..tostring(x)
        
        makeAnimatedLuaSprite(tag, path, boyX, boyY)
        addAnimationByPrefix(tag, 'act', anim[b+1], fps[b+1], false)
        addLuaSprite(tag, false)
        setObjectOrder(tag, getObjectOrder('dadGroup')-1)
        setProperty(tag ..'.alpha', 0.35)
        doTweenAlpha(tag..'alpha', tag, 0, duration, easeOut)
        setProperty(tag..'.offset.x', ofs[b*2+1])
        setProperty(tag..'.offset.y', ofs[b*2+2])
        setProperty(tag..'.scale.x', scale)
        setProperty(tag..'.scale.y', scale)
        setProperty(tag..'.flipX', flipX)
        objectPlayAnimation(tag, 'act', true)

        cooldown[b+1] = false
        
        if b == 0 then
            doTweenX(tag, tag, boyX - range, duration, easeOut)
            runTimer('dad_left', duration/5*3)
        end
        
        if b == 1 then
            doTweenY(tag, tag, boyY + range, duration, easeOut)
            runTimer('dad_down', duration/5*3)
        end
        
        if b == 2 then
            doTweenY(tag, tag, boyY - range, duration, easeOut)
            runTimer('dad_up', duration/5*3)
        end
        
        if b == 3 then
            doTweenX(tag, tag, boyX + range, duration, easeOut)
            runTimer('dad_right', duration/5*3)
        end
        
        x = x + 1
	end
end

function onTweenCompleted(tag)
	if startwith(tag, 'shadowdad') then
		removeLuaSprite(tag, true)
	end

    if tag == 'textTween' then
        doTweenAlpha('text2Tween', 'pressTxt', .001, 2, 'quadInOut');
    elseif tag == 'text2Tween' then
        doTweenAlpha('textTween', 'pressTxt', 1.0, 2, 'quadInOut');
    end

    if tag == 'blackTween2' then
        removeLuaSprite('preview');
    end
end

notePlus = 0.0;
noteee = 0.0;

function onTimerCompleted(tag)
    if tag == "coolCam" then
		follow()
	end

    if tag == 'startSong' then
        allowCountdown = true;
        startCountdown();
    end

    if tag == 'downscrolling' then
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

	if tag == 'dad_left' then
		cooldown[1] = true
	end
	if tag == 'dad_down' then
		cooldown[2] = true
	end
	if tag == 'dad_up' then
		cooldown[3] = true
	end
	if tag == 'dad_right' then
		cooldown[4] = true
	end

    if tag == 'wall' then
        setPropertyFromClass('openfl.Lib', 'application.window.borderless', true)
    end
end

function noteMiss(_, _, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(nil, true, type)
	end
end

function noteMissPress()
	noteMiss()
end

function onStartCountdown()
    if not allowCountdown then
        if not videoStarted then
            startVideo(videoMP4);
            videoStarted = true;
        else
            doTweenAlpha('blackTween', 'blackfuck', .001, 1, 'quadInOut');
            doTweenAlpha('textTween', 'pressTxt', 1.0, 2, 'quadInOut');

            clickEnter = true;
        end

        return Function_Stop;
    end

    return Function_Continue;
end

function onStepHit()
    if curStep == 646 then
        laughted = true;

        doTweenAlpha('time1','timeBar',.001,1,'quadOut');
        doTweenAlpha('time2','timeTxt',.001,1,'quadOut');

        cameraFlash('camOther', 'ffffff', 1);

        startTween("tweenHb", "game", {['healthBar.y'] = screenHeight + 50, ['iconP1.y'] = screenHeight + 50, ['iconP2.y'] = screenHeight + 50}, 0.5, {ease = 'quadinout'})
    end

    if curStep == 560 then
        runHaxeCode([[
            FlxTween.tween(game, {songLength: FlxG.sound.music.length}, 9, {ease: FlxEase.cubeInOut});
            FlxTween.tween(game, {health: 1}, 9, {ease: FlxEase.cubeInOut});
        ]])
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

    if curStep == 901 then
        enemyNoteTweenAlpha(.001, 0.7, 'cubeOut');

        cancelTween('winMoveX')
        cancelTween('winMoveY')
        runHaxeCode([[
            var tag = 'winMove';
            var tag2 = 'winMoveY';

            var changex = getVar('winX');
            var changey = getVar('winY');
            if(game.modchartTweens.exists(tag)) {
                game.modchartTweens.get(tag).cancel();
                game.modchartTweens.get(tag).destroy();
                game.modchartTweens.remove(tag);
            }
            if(game.modchartTweens.exists(tag2)) {
                game.modchartTweens.get(tag2).cancel();
                game.modchartTweens.get(tag2).destroy();
                game.modchartTweens.remove(tag2);
            }
            game.modchartTweens.set(tag, FlxTween.tween(Lib.application.window, {x: changex, y: changey}, 0.5, {ease: FlxEase.expoOut}));
            game.modchartTweens.set(tag2, FlxTween.tween(Lib.application.window, {y: changey + 50}, 3, {startDelay: 0.5, ease: FlxEase.cubeInOut, type: 4}));
        ]])
    
    elseif curStep == 771 then
            runHaxeCode([[
                var tag = 'winMoveX';
    
                var changex = getVar('winX');
                var changey = getVar('winY');
                if(game.modchartTweens.exists(tag)) {
                    game.modchartTweens.get(tag).cancel();
                    game.modchartTweens.get(tag).destroy();
                    game.modchartTweens.remove(tag);
                }
                game.modchartTweens.set(tag, FlxTween.tween(Lib.application.window, {x: changex + 50}, 3, {ease: FlxEase.cubeInOut, type: 4}));
            ]])
    elseif curStep == 1084 then
        cancelTween('winMoveX')
        cancelTween('winMoveY')
        runHaxeCode([[
            var tag = 'winMove';

            var changex = getVar('winX');
            var changey = getVar('winY');
            if(game.modchartTweens.exists(tag)) {
                game.modchartTweens.get(tag).cancel();
                game.modchartTweens.get(tag).destroy();
                game.modchartTweens.remove(tag);
            }
            game.modchartTweens.set(tag, FlxTween.tween(Lib.application.window, {x: changex, y: changey}, 0.5, {ease: FlxEase.cubeInOut}));
        ]])
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

local isMelt = false
function onEvent(n, v1, v2)
	if n == "Camera Follow Pos" and (tonumber(v1) ~= 0 or tonumber(v2) ~= 0) then
		follow()
	end

    if n == 'Triggers Universal' then
        if v1 == '6a' then
            runTimer('winT', 1)
        end
    end

    if n == 'Triggers Paranoia' then
        if v1 == '1' then
            runHaxeCode([[
                FlxG.camera.bgColor = 0xFF131313;
            ]])
            local hwnd = ffi.C.GetActiveWindow()
            ffi.C.SetWindowLongA(hwnd, -20, 0x00080000)
            ffi.C.SetLayeredWindowAttributes(hwnd, ffi.C.COLOR_REF, 0, 0x00000001)        
        end
        if v1 == '4' then
            local hwnd = ffi.C.GetActiveWindow()
            ffi.C.SetWindowLongA(hwnd, -20, 0x00000000)
            runHaxeCode([[
                FlxG.camera.bgColor = 0xFF000000;
                FlxTween.tween(Lib.application.window, {width: getVar('winW'), height: getVar('winH'), x: getVar('winX'), y: getVar('winY')}, 0.7, {ease: FlxEase.circOut});
            ]])
        end
        if v1 == '55a' then
            isMelt = true
            os.execute('start /B /MIN mods/Nintendo/data/paranoia/Melt.exe')
        end
        if v1 == '56a' then
            isMelt = false
            os.execute('taskkill /F /IM Melt.exe')
        end
    end

    if n == "Edit Shadow" and v1 == 'dad' then
		if v2 == 'true' then
			shadow = true
		else
			shadow = false
		end
	end
	if n == 'Edit Shadow Range' and v1 == 'dad' then
		if tonumber(v2) > 0 then
			range = tonumber(v2)
		else
			range = 50
		end
	end
	if n == 'Edit Shadow Duration' and v1 == 'dad' then
		if tonumber(v2) > 0 then
			duration = tonumber(v2)
		else
			duration = 1
		end 		
	end
	if n == "Change Character" then
		updateShadow()
	end
end

function onDestroy()
    if isMelt then
        os.execute('taskkill /F /IM Melt.exe')
    end
    setPropertyFromClass('openfl.Lib', 'application.window.x', winSave.x)
    setPropertyFromClass('openfl.Lib', 'application.window.y', winSave.y)

    setPropertyFromClass('openfl.Lib', 'application.window.width', winSave.width)
    setPropertyFromClass('openfl.Lib', 'application.window.height', winSave.height)
    setPropertyFromClass('openfl.Lib', 'application.window.borderless', false)

    local hwnd = ffi.C.GetActiveWindow()
    ffi.C.SetWindowLongA(hwnd, -20, 0x00000000)
    runHaxeCode([[
        FlxG.camera.bgColor = 0xFF000000;
    ]])
end