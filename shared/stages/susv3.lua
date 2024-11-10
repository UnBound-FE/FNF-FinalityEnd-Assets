local x = -550
local y = -140

function onCreate()
    makeLuaSprite('plate', 'plate', -2250, -1750);
    setScrollFactor('plate', 1, 1);
    scaleObject('plate', 1.75, 1.75);

    makeLuaSprite('deadbody', 'deadbody', -1450, -850);
    setScrollFactor('deadbody', 1, 1);
    scaleObject('deadbody', 1.75, 1.75);

    makeLuaSprite('screenofdeath', 'screenofdeath', -1050, -500);
    setScrollFactor('screenofdeath', 1, 1);
    scaleObject('screenofdeath', 1.5, 1.5);

   

    makeLuaSprite('miniplate', 'miniplate', 3400, 1200);
    setScrollFactor('miniplate', 1, 1);
    scaleObject('miniplate', 1, 1);

    makeLuaSprite('missingbodies', 'missingbodies', -600, -2200);
    setScrollFactor('missingbodies', 1, 1);
    scaleObject('missingbodies', 2.4, 2.4);

    addLuaSprite('screenofdeath', false)
    addLuaSprite('plate', false)
    addLuaSprite('missingbodies', true)
    addLuaSprite('miniplate', false)
    addLuaSprite('deadbody', false)

    function onBeatHit()
        if curBeat %2 == 0 then
            objectPlayAnimation('glitch', 'glitch')

        end
    end
end