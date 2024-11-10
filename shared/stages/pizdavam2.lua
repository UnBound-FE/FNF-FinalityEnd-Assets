local x = -700
local y = -165

function onCreate()
    makeLuaSprite("bla","pizdavam",x,y)
    makeLuaSprite("sl","zanaves2",-1150 ,-650)
    setScrollFactor('sl', 1, 1);
    scaleObject('sl', 1.35, 1.35);
    makeLuaSprite("blas","zanaves",-700 , -300)
    makeAnimatedLuaSprite("il", "ilshiorii", -575, -10) 
    addAnimationByPrefix("il", "dadada", "ilshiorii", 24, true)
    addLuaSprite("bla",false)
    addLuaSprite("sl",false)
    addLuaSprite("blas",true)
    addLuaSprite("sl",false)
    addLuaSprite("il",false)
end