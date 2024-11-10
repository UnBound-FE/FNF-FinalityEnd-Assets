function onCreate()
    makeLuaSprite('blackS', nil, -640, -350)                                                    makeGraphic('blackS', 2000, 2000, '000000')         setScrollFactor('blackS', 0, 0);         scaleObject('blackS', 2.2, 2.2);         setProperty('blackS.alpha', 1)    setObjectCamera('blackS', 'camHUD')    addLuaSprite('blackS', true)
    end
    function onStepHit()
    if curStep == 1 then
    doTweenAlpha('blackTween','blackS', 0, 8, 'quadIn')
    end
    end