local ease = 'quartinout'
function onEvent(n, v1, v2)
    if n == '360' then        
        doTweenAngle('camGame', 'camGame', v1, v2, ease)

        function onTweenCompleted(tag)
            if tag == 'camGame' then
                if not v2 == 360 then
                    doTweenAngle('camGameback', 'camGame', 0, v2, ease)
                end
            end
        end
    end
end
