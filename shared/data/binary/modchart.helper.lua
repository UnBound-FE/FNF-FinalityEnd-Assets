bf = {};

bf_settings = {
  pop_hit = false,
  hard_shit_moment = false,

  __sin_p = 1,
  __sin_dur = math.exp(100),
  __sin_mult = .0,

  __cos_p = 1,
  __cos_dir = math.exp(100),
  __cos_mult = .0
};

bf_pos = {
  curX1 = 0,
  curX2 = 0,
  curX3 = 0,
  curX4 = 0
}

function bf.SetSettingsToDefault()
  bf_settings.pop_hit = false
  bf_settings.hard_shit_moment = false

  bf_settings.__sin_p = 1
  bf_settings.__sin_dur = math.exp(100)
  bf_settings.__sin_mult = .0

  bf_settings.__cos_p = 1 --10
  bf_settings.__cos_dur = math.exp(100) --20
  bf_settings.__cos_mult = .0 --.4
end

function bf.SetDownScroll()
  for i=4,7 do
    if downscroll then
      setPropertyFromGroup('strumLineNotes', i, 'downScroll', false);
    else
      setPropertyFromGroup('strumLineNotes', i, 'downScroll', true);
    end
  end
end

function bf.SetUpScroll()
  for i=4,7 do
    if downscroll then
      setPropertyFromGroup('strumLineNotes', i, 'downScroll', true);
    else
      setPropertyFromGroup('strumLineNotes', i, 'downScroll', false);
    end
  end
end

function bf.NoteTweenX(value, duration, ease)
  for i=4,7 do
    cancelTween('bfX-'..i);
    noteTweenX('bfX-'..i, i, _G['defaultPlayerStrumX'..(i-4)] + value, duration, ease);
  end

  bf_pos.curX1 = defaultPlayerStrumX0 + value;
  bf_pos.curX2 = defaultPlayerStrumX1 + value;
  bf_pos.curX3 = defaultPlayerStrumX2 + value;
  bf_pos.curX4 = defaultPlayerStrumX3 + value;
end

function bf.NoteTweenY(value, duration, ease)
  for i=4,7 do
    cancelTween('bfY-'..i);
    noteTweenY('bfY-'..i, i, _G['defaultPlayerStrumY'..(i-4)] + value, duration, ease);
  end
end

function bf.NoteTweenAngle(value, duration, ease)
  for i=4,7 do
    cancelTween('bfAng-'..i);
    noteTweenAngle('bfAng-'..i, i, value, duration, ease);
  end
end

function bf.NoteTweenAlpha(value, duration, ease)
  for i=4,7 do
    cancelTween('bfAlph-'..i);
    noteTweenAlpha('bfAlph-'..i, i, value, duration, ease);
  end
end

function bf.UpdateNote(currentBeat)
  for i=4,7 do
    setProperty('strumLineNotes.members['..i..'].y', getProperty('strumLineNotes.members['..i..'].y') + bf_settings.__sin_p * math.sin((currentBeat + i * bf_settings.__sin_mult) * math.pi) / bf_settings.__sin_dur);
  end

  for i=0,3 do
    setProperty('playerStrums.members['..i..'].x', getProperty('playerStrums.members['..i..'].x') + bf_settings.__cos_p * math.cos((currentBeat + i * bf_settings.__cos_mult) * math.pi) / bf_settings.__cos_dur);
  end
end

dad = {};

function dad.NoteTweenX(value, duration, ease)
  for i=0,3 do
    cancelTween('dadX-'..i);
    noteTweenX('dadX-'..i, i, _G['defaultOpponentStrumX'..i] + value, duration, ease);
  end
end

function dad.NoteTweenY(value, duration, ease)
  for i=0,3 do
    cancelTween('dadY-'..i);
    noteTweenY('dadY-'..i, i, _G['defaultOpponentStrumY'..i] + value, duration, ease);
  end
end

function dad.NoteTweenAngle(value, duration, ease)
  for i=0,3 do
    cancelTween('dadAng-'..i);
    noteTweenAngle('dadAng-'..i, i, value, duration, ease);
  end
end

function dad.NoteTweenAlpha(value, duration, ease)
  for i=0,3 do
    cancelTween('dadAlph-'..i);
    noteTweenAlpha('dadAlph-'..i, i, value, duration, ease);
  end
end

all = {};

function all.AddAngle(index, value)
  setProperty('strumLineNotes.members['..index..'].angle', value);
end

function all.AddNoteY(index, value)
  setProperty('strumLineNotes.members['..index..'].y', getProperty('strumLineNotes.members['..index..'].y') + value);
end

function all.NoteTweenX(value, duration, ease)
  for i=0,3 do
    cancelTween('dadX-'..i);
    noteTweenX('dadX-'..i, i, _G['defaultOpponentStrumX'..i] + value, duration, ease);
  end

  for i=4,7 do
    cancelTween('bfX-'..i);
    noteTweenX('bfX-'..i, i, _G['defaultPlayerStrumX'..(i-4)] + value, duration, ease);
  end
end

function all.NoteTweenY(value, duration, ease)
  for i=0,3 do
    cancelTween('dadY-'..i);
    noteTweenY('dadY-'..i, i, _G['defaultOpponentStrumY'..i] + value, duration, ease);
  end

  for i=4,7 do
    cancelTween('bfY-'..i);
    noteTweenY('bfY-'..i, i, _G['defaultPlayerStrumY'..(i-4)] + value, duration, ease);
  end
end

function all.NoteTweenAngle(value, duration, ease)
  for i=0,3 do
    cancelTween('dadAng-'..i);
    noteTweenAngle('dadAng-'..i, i, value, duration, ease);
  end

  for i=4,7 do
    cancelTween('bfAng-'..i);
    noteTweenAngle('bfAng-'..i, i, value, duration, ease);
  end
end

function all.NoteTweenAlpha(value, duration, ease)
  for i=0,3 do
    cancelTween('dadAlph-'..i);
    noteTweenAlpha('dadAlph-'..i, i, value, duration, ease);
  end

  for i=4,7 do
    cancelTween('bfAlph-'..i);
    noteTweenAlpha('bfAlph-'..i, i, value, duration, ease);
  end
end
