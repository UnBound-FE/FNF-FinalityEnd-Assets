function onEvent(n,v1,v2)
	if n == 'Countdown' then
		-- makes the sprites
		makeLuaSprite('countdown two', 'ready', 0, 0);
		setObjectCamera('countdown two', 'camHud');
		screenCenter('countdown two', 'xy')
		makeLuaSprite('countdown one', 'set', 0, 0);
		setObjectCamera('countdown one', 'camHud');
		screenCenter('countdown one', 'xy')
		makeLuaSprite('countdown go', 'go', 0, 0);
		setObjectCamera('countdown go', 'camHud');
		screenCenter('countdown go', 'xy')
		count = tonumber(v1)
		volume = tonumber(v2)
		if count == 3 then
			playSound('intro3', v2)
		end
		if count == 2 then
			playSound('intro2', v2)
			addLuaSprite('countdown two', true);
			doTweenAlpha('two alpha', 'countdown two', 0, crochet / 1000, 'cubeInOut');
		end
		if count == 1 then
			playSound('intro1', v2)
			addLuaSprite('countdown one', true);
			doTweenAlpha('one alpha', 'countdown one', 0, crochet / 1000, 'cubeInOut');
		end
		if count == 0 then
			playSound('introGo', v2)
			addLuaSprite('countdown go', true);
			doTweenAlpha('go alpha', 'countdown go', 0, crochet / 1000, 'cubeInOut');
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'two alpha' then
		removeLuaSprite('countdown two', false)
	end
	if tag == 'one alpha' then
		removeLuaSprite('countdown one', false)
	end
	if tag == 'go alpha' then
		removeLuaSprite('countdown go', false)
	end
end
