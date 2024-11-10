local x = -520
local y = -20

function onCreate()
    makeLuaSprite("bg", "susanahz", x, y) -- bg

   

    makeLuaSprite("fg", "pzdnahu", x, y) -- groun

    makeLuaSprite("da", "lightlmaosuka", x, y)

    addLuaSprite("bg", false)
    addLuaSprite("fg", false)    
    addLuaSprite("da", true) 
end