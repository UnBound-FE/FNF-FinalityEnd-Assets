function onCreate() -- Add The Flicker

	makeAnimatedLuaSprite('bob', 'bob', -75, -32)
	
	-- Properties
	setScrollFactor('bob', 0, 0)
	scaleObject('bob', 1.2, 1.1)
	
	-- Animations
	addAnimationByPrefix('bob', 'bob', 'bob', 24, false)
	
end

function onEvent(name, value1, value2)
	if name == 'bob' then
	playSound('bobjumpscare')
	runTimer('bob', 0.7, 1)
        runTimer('bob', 0.3, 2)
        runTimer('bob', 0.4, 13)
        runTimer('bob', 0.3, 1)
	addLuaSprite('bob', true)
        
	objectPlayAnimation('bob', true)
        setProperty('bob.visible', true)
	triggerEvent('Add Camera Zoom', '1 2', '1, 2');
        triggerEvent('Screen Shake', '0.1, 0.1', '0.1, 0.1');
	end
end
	
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'bob' then
	setProperty('bob.visible', false)
      
        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

        setProperty('bob.visible', true)

        setProperty('bob.visible', false)

	end
end

