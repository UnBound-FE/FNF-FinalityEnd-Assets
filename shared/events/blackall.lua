function onCreate()
makeLuaSprite('BlackOAlgo', '', 0, 0)
makeGraphic('BlackOAlgo', screenWidth, screenHeight,'000000')
setObjectCamera('BlackOAlgo', 'other')
setProperty('BlackOAlgo.alpha', 0)
addLuaSprite('BlackOAlgo', true)
scaleObject('BlackOAlgo', 1,1);
end


function onEvent(name,value1,value2)
if name == 'blackall' then
doTweenAlpha('BlackOAlgo', 'BlackOAlgo', value1, value2, 'linear')
end 
end