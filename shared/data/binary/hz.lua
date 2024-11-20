function onStepHit()
    if curStep == 646 then
        if downscroll then
            startTween("tweenHb", "game", {['healthBar.y'] = -500, ['iconP1.y'] = -500, ['iconP2.y'] = -500}, 0.5, {ease = 'quadinout'})
        else
            startTween("tweenHb", "game", {['healthBar.y'] = screenHeight + 50, ['iconP1.y'] = screenHeight + 50, ['iconP2.y'] = screenHeight + 50}, 0.5, {ease = 'quadinout'})
        end
    end
end
