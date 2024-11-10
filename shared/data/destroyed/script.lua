-- CHANGE THE OFFSET VARIABLE FOR MORE OR LESS CAMERA MOVEMENT!!
local offset = 75
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

-- you can change this one to custom it yourself
local shadow = true -- true if you want turn on the shadow and false if you want turn it off
local range = 50 -- for the shadow range
local duration = 1 -- for how long the shadow still

function onCreate()
  setProperty("skipCountdown", true)

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
end

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

function onCreatePost()
	updateShadow()
end

function onTimerCompleted(tag)
	if tag == "coolCam" then
		follow()
	end
end

function goodNoteHit(_, data, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, true, type)
	end
end

function opponentNoteHit(_, data, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(data, false, type)
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

function noteMiss(_, _, type)
	if not getProperty("isCameraOnForcedPos") then
		follow(nil, true, type)
	end
end

function onTweenCompleted(tag)
	if startwith(tag, 'shadowdad') then
		removeLuaSprite(tag, true)
	end
end

function onTimerCompleted(tag)
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
end

function noteMissPress()
	noteMiss()
end

function onEvent(n, v1, v2)
	if n == "Camera Follow Pos" and (tonumber(v1) ~= 0 or tonumber(v2) ~= 0) then
		follow()
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

function onUpdate(e)
  if shadersEnabled then
    setShaderFloat('tvEffect', 'iTime', os.clock())
  end
end
