local x = -700
local y = -165

function onCreate()
    makeLuaSprite("eyeeye","eyeeye",-1050, -500)
    setScrollFactor('eyeeye', 1, 1);
    scaleObject('eyeeye', 1.25, 1.25);

    addLuaSprite("eyeeye",false)
end