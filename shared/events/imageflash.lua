function onEvent(name, value1, value2)
    if name == 'imageflash' then
         makeLuaSprite('image', value1, 0, 0)
         addLuaSprite('image', true)
         setObjectCamera('image', 'hud')
         setScrollFactor("image", 0.0, 0.0)
         setObjectOrder("image", getObjectOrder("scoreTxt") -20)
         runTimer('byebye', value2)
     end
 end
 function onTimerCompleted(tag)
     if tag == 'byebye' then
         removeLuaSprite('image', true)
     end
 end