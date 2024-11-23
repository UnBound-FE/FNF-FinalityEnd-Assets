local x = -700
local y = -165

function onCreate()
    makeAnimatedLuaSprite("f", "bg", -730, 100)
    addAnimationByPrefix("f", "sas", "bg flex", 24, true)
    setScrollFactor('f', 1, 1);
    scaleObject('f', 1.2, 1.2);
    makeAnimatedLuaSprite("d", "charlottexml", -80, 480)
    addAnimationByPrefix("d", "sus", "charlottexml idle", 24, true)
    setScrollFactor('d', 1, 1);
    scaleObject('d', 0.7, 0.7);
    makeAnimatedLuaSprite("s", "mr alex", 30, 480)
    addAnimationByPrefix("s", "ses", "mr alex flex", 24, true)
    setScrollFactor('s', 1, 1);
    scaleObject('s', 0.7, 0.7);
    makeAnimatedLuaSprite("r", "rd and dl", -5900, -3100)
    addAnimationByPrefix("r", "sсs", "rd and dl super flex", 24, true)
    setScrollFactor('r', 1, 1);
    scaleObject('r', 5, 5);
    addLuaSprite("f", false)
    addLuaSprite("d", false)
    addLuaSprite("s", false)
    addLuaSprite("r", false)
end
