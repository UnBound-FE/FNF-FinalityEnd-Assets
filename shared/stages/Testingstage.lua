local x = -700
local y = -165

function onCreate()
    makeLuaSprite("b","back",x,y)
    setScrollFactor('b', 1, 1);
    scaleObject('b', 1.2, 1.2);
    makeAnimatedLuaSprite("an", "anom", x, y) -- fire bg
    addAnimationByPrefix("an", "a", "ani", 20, true)
    addLuaSprite("b",false)
    addLuaSprite("an",false)
end