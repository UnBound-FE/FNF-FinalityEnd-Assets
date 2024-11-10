local x = -800
local y = -240

function onCreate()
    makeLuaSprite("f","andr",x,y)
    makeLuaSprite("b","andr",x,y)
    addLuaSprite("b",false)
    addLuaSprite("f",false)
end