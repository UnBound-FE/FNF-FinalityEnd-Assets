local x = -550
local y = -165

function onCreate()
    makeLuaSprite("bg", "pridumal", x, y) -- bg

    makeAnimatedLuaSprite("fire", "sareda", x, y) -- fire bg
    addAnimationByPrefix("fire", "da", "fireda", 24, true)

    makeLuaSprite("fg", "pol", x, y) -- ground
    
    addLuaSprite("bg", false)
    addLuaSprite("fire", false)
    addLuaSprite("fg", false)    
end