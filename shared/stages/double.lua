local x = -1260
local y = -850

function onCreate()
    makeAnimatedLuaSprite('sd', 'scarygb', 1050, 100);
    scaleObject('sd', 0.7, 0.7);
    addAnimationByPrefix("sd", "da", "onver", 24, true)
    addLuaSprite("sd",false)
end
