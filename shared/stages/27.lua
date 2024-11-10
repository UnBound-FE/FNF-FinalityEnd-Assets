local x = -700
local y = -165

function onCreate()
    makeLuaSprite("borV","died",x,y)
    makeLuaSprite("bord","diedbody",x,y)
    addLuaSprite("borV",false)
    addLuaSprite("bord",false)
end