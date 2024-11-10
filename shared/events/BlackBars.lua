function onCreate()
    -- Cria a barra preta na parte superior (bar1)
    makeLuaSprite('bar1', '', 0, -150)
    makeGraphic('bar1', screenWidth, 150, '000000')
    setObjectCamera('bar1', 'hud')
    addLuaSprite('bar1', false)

    -- Cria a barra preta na parte inferior (bar2)
    makeLuaSprite('bar2', '', 0, screenHeight)
    makeGraphic('bar2', screenWidth, 150, '000000')
    setObjectCamera('bar2', 'hud')
    addLuaSprite('bar2', false)
end

function onEvent(n, one, two)
    if n == 'BlackBars' then
        if one == 'true' then
            doTweenY('bar1tween', 'bar1', 0, 0.1, 'QuartOut')
            doTweenY('bar2tween', 'bar2', screenHeight - 150, 0.1, 'QuartOut')
        elseif one == 'false' then
            doTweenY('bar1tween', 'bar1', -150, 0.1, 'QuartOut')
            doTweenY('bar2tween', 'bar2', screenHeight, 0.1, 'QuartOut')
        end
    end
end
