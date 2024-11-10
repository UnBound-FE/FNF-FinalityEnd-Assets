function onStepHit()
    if curStep == 1536 then
        startTween("tweenHb", "game", {['healthBar.y'] = screenHeight + 50, ['iconP1.y'] = screenHeight + 50, ['iconP2.y'] = screenHeight + 50}, 0.5, {ease = 'quadinout'})
    end
end