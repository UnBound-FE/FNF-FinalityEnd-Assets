function onEvent(name,value1,value2)

    if name == "zoom" then
        
        if value2 == '' then
      	  setProperty("defaultCamZoom",value1)
	debugPrint(value2 )
	else
            doTweenZoom('zoomCam','camGame',tonumber(value1),tonumber(value2),'sineInOut')
	end
            
    end


end

function onTweenCompleted(name)

if name == 'zoomCam' then


      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 

end


end