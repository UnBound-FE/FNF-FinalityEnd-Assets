--Script made by Bloxy9000, pls credit me if used or don't remove this text

function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT') then
setProperty('health', 0);
setPropertyFromClass('GameOverSubstate', 'characterName', 'BOYFRIEND_DEAD'); --character name for game over (remove this line for normal)
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --death sund for game over (remove this line for normal)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --character name for game over (remove this line for normal)
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --character name for game over (remove this line for normal) 
end
end