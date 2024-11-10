local x = -1260
local y = -850

function onCreate()
    makeAnimatedLuaSprite('sh', 'shioriilove', -400, 0);
    scaleObject('sh', 0.6, 0.6);
    addAnimationByPrefix("sh", "da", "idles", 24, true)
    addLuaSprite("sh",false)
end
