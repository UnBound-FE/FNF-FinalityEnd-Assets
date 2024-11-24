local vignetteShader = "test5"
local tvShader = "test3"
local GlitchShader = "vcr"
function onCreate()
    if shadersEnabled then
        makeLuaSprite("vigCamShader")
        makeLuaSprite("tvEffect")
        makeLuaSprite("vcr")
        runHaxeCode([[
            var vignetteShader = "]] .. vignetteShader .. [[";
            var tvEffect = "]] .. tvShader .. [[";
            var vcr = "]] .. GlitchShader .. [[";

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
