local x = -700
local y = -165

function onCreate()
    makeLuaSprite("bla","binar/newbg",x,y)
    makeLuaSprite("sl","binar/zanaves3",x,y)
    addLuaSprite("bla",false)
    addLuaSprite("sl",true)
end
