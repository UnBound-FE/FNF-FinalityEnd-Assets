local x = -520
local y = -20

function onCreate()
    makeLuaSprite("bg", "susanahz", x, y) -- bg

    makeAnimatedLuaSprite("hzshto", "dancelmao", x, 50) -- fire bg
    addAnimationByPrefix("hzshto", "dancelol", "danc", 24, true)

    makeLuaSprite("fz", "eshkere", -1000, 0) -- ground

    makeLuaSprite("fd", "shd", -1000, y)
    scaleObject('fd', 3, 3);

    makeLuaSprite("da", "lightlmaosuka", -1000, y)
    scaleObject('da', 3, 3);

   
    
    addLuaSprite("bg", false)
    addLuaSprite("hzshto", false)
    addLuaSprite("fz", false)    
    addLuaSprite("fd", true) 
    addLuaSprite("da", true) 
    addLuaSprite("fs", false)
end