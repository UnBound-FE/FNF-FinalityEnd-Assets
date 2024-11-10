function onCreate()
makeLuaSprite('jump', 'scr1', 0, 0)
addLuaSprite('jump', true)
scaleObject('jump', 1, 1)
setObjectCamera('jump', 'other')
setProperty('jump.alpha', 0)
screenCenter('jump','xy')
end

function onTimerCompleted(t,l,ll)
if t == 'jump' then
setProperty('jump.alpha', 1)
runTimer('scare',1.5)
end
if t == 'scare' then
doTweenAlpha('scare', 'jump', 0, 1.3, 'sineIn');
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
 if noteType == 'Jumpscare' then
playSound('mechanics/Screamer2', 1)
cameraShake('other', '0.03', '1')
runTimer('jump',0.1)
 end
end