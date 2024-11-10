local x = -550
local y = -100
local y1 = 10000000
local x1 = -400

function onCreate()
    makeLuaSprite("D","three3",x,y)
    makeAnimatedLuaSprite("scar", "scarymonsteers", x1, y1) -- fire bg
    addAnimationByPrefix("scar", "suka", "spydaysuhariki", 12, true)
    makeLuaSprite("R","PRYS",x,y)
    addLuaSprite("D",false)
    addLuaSprite("scar",false)
    addLuaSprite("R",false)
    setObjectOrder('dadGroup', getObjectOrder('R')-1)
end 
