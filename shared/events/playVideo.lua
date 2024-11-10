function onEvent(name, value1, value2)
     if name == 'cut1' then
          startVideo(value1, value2)
          return Function_Stop
     end
     return Function_Continue
end