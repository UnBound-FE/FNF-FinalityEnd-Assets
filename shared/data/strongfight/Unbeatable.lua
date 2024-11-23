local vignetteShader = "test5"
local tvShader = "test3"
function onCreate()
    if shadersEnabled then
        makeLuaSprite("vigCamShader")
        makeLuaSprite("tvEffect")
        runHaxeCode([[
            var vignetteShader = "]] .. vignetteShader .. [[";
            var tvEffect = "]] .. tvShader .. [[";
            
            game.initLuaShader(vignetteShader);
            game.initLuaShader(tvEffect);
            
            var shader0 = game.createRuntimeShader(vignetteShader);
            var shader1 = game.createRuntimeShader(tvEffect);
            
            game.getLuaObject("vigCamShader").shader = shader0;
            game.getLuaObject("tvEffect").shader = shader1;

            game.camGame.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
            game.camHUD.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
            return;
        ]])
        function onUpdatePost(elapsed)
            setShaderFloat('tvEffect', 'iTime', os.clock())
        end
    end
end