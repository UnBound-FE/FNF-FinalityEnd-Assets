shaderFile = 'AreaCloneEffect';

function onCreate()
   luaDebugMode = true;
   luaDeprecatedWarnings = true;

   initLuaShader(shaderFile)
   makeLuaSprite("shaderSpr")
   makeGraphic("shaderSpr",screenWidth,screenHeight);
   setSpriteShader("shaderSpr",shaderFile)

   runHaxeCode([[
      if(FlxG.save.data.shaders)
      {
         game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderSpr").shader)]);
         //game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shaderSpr").shader)]);
      }
   ]]);


   setShaderFloat('shaderSpr', 'x', 0);
   setShaderFloat('shaderSpr', 'y', 0);
   --setProperty('camGame.zoom',getProperty('camGame.zoom')-0.5);
   setShaderFloat('shaderSpr', 'fade', 0.0);
end

whatBeat = 0;

function onBeatHit()
   whatBeat = whatBeat + 1;

   if whatBeat > 1 then
      whatBeat = 0;
   end

   if whatBeat == 0 then
      setShaderFloat('shaderSpr', 'posXStart', 1280);
      setShaderFloat('shaderSpr', 'posXEnd', 0);
      setShaderFloat('shaderSpr', 'posYStart', 720);
      setShaderFloat('shaderSpr', 'posYEnd', 0);
      setShaderFloat('shaderSpr','fade',0.75);
   elseif whatBeat == 1 then
      setShaderFloat("shaderSpr", "fade", 0.0);
   end
end

function shaderClear()
   runHaxeCode([[
      game.camGame.setFilters([]);
      game.camHUD.setFilters([]);
   ]])
end

function onGameOver()
   shaderClear()
end

function onDestroy()
   shaderClear()
end