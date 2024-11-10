function onEvent(n, v1, v2)
    if n == 'Arrow Hole in the Stick' then
        if v2 == '' or v2 == nil then
              noteTweenX('note-0',4,defaultPlayerStrumX3,v1)
              noteTweenX('note-1',5,defaultPlayerStrumX2,v1)
              noteTweenX('note-2',6,defaultPlayerStrumX1,v1)
              noteTweenX('note-3',7,defaultPlayerStrumX0,v1)
        else
              noteTweenX('note-0',4,defaultPlayerStrumX0,v1)
              noteTweenX('note-1',5,defaultPlayerStrumX1,v1)
              noteTweenX('note-2',6,defaultPlayerStrumX2,v1)
              noteTweenX('note-3',7,defaultPlayerStrumX3,v1)
        end
    end
 end