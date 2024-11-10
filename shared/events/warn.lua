function onEvent(n, v1, v2)
    local ease = 'quadout'
    if n == 'warn' then
        makeLuaSprite("warn", 'warn', 0, 0)
        setObjectCamera("warn", 'hud')
        screenCenter("warn", 'xy')
        setProperty("warn.alpha", 0)
        addLuaSprite("warn")
        if v1 == 'on' then
            doTweenAlpha("warnin", "warn", 1, 0.4, ease)
        end
        runTimer("warnRun", 0.9)
        function onTimerCompleted(tag)
            if tag == 'warnRun' then
                doTweenAlpha("warnout", "warn", 0, 0.4, ease)
            end
        end
        function onTweenCompleted(tag)
            if tag == 'warnout' then
                removeLuaSprite("warn")
            end
        end
    end
end