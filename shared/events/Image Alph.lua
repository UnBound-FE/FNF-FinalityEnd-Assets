local imgName = 'bob jumpscare'; 

function onEvent(n, v1, v2)
   if n == 'Image Alph' then
       makeLuaSprite('img',imgName,0,0);
       setObjectCamera('img','camOther');
       addLuaSprite('img');

       doTweenAlpha('imgT','img',0,1);
   end
end