local x = -700
local y = -165

function onCreate()
    createInstance('bgbin', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, 0, 0})
    loadGraphic('bgbin', 'destroy/bin')
    setProperty('bgbin.velocity.x', 50)
    setProperty('bgbin.y', 100)
    addInstance('bgbin', false)

    makeLuaSprite("d", "destroy/ey", -700, -165)
    addLuaSprite("d", false)

    makeLuaSprite("b", "destroy/UG", -700, -165)
    addLuaSprite("b", false)
end
function onStepHit()
    if curStep == 588 then
        doTweenAlpha('bgbin', 'bgbin', 0, 0.3, 'linear')
        doTweenAlpha('b', 'b', 0, 0.3, 'linear')
    end
    if curStep == 1179 then
        doTweenAlpha('bgbin', 'bgbin', 1, 0.1, 'linear')
        doTweenAlpha('b', 'b', 1, 0.1, 'linear')
    end
    if curStep == 1 then
        doTweenAlpha('d', 'd', 0, 0.1, 'linear')
    end
    if curStep == 657 then
        doTweenAlpha('d', 'd', 1, 0.1, 'linear')
    end
    if curStep == 1179 then
        doTweenAlpha('d', 'd', 0, 0.1, 'linear')
    end
end
