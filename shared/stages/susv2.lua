local x = -550
local y = -140

function onCreate()
    makeLuaSprite('plate', 'emp/plate', -2150, -1350);
    setScrollFactor('plate', 1, 1);
    scaleObject('plate', 0.8, 0.8);

    makeLuaSprite('deadbody', 'emp/deadbody', -1400, -300);
    setScrollFactor('deadbody', 1, 1);
    scaleObject('deadbody', 1.50, 1.50);

    makeLuaSprite('screenofdeath', 'emp/screenofdeath', -1050, -300);
    setScrollFactor('screenofdeath', 1, 1);
    scaleObject('screenofdeath', 1.5, 1.5);

    makeAnimatedLuaSprite('glitch', 'emp/glitch', -2100, -350);
    setScrollFactor('glitch', 1, 1);
    scaleObject('glitch', 2, 2);
    addAnimationByPrefix('glitch','glitch','glitch',24,false);
    setBlendMode('dark','multiply')




    addLuaSprite('screenofdeath', false)
    addLuaSprite('glitch', false)
    addLuaSprite('plate', false)
    addLuaSprite('deadbody', true)

    function onBeatHit()
        if curBeat %2 == 0 then
            objectPlayAnimation('glitch', 'glitch')

        end
    end
end
