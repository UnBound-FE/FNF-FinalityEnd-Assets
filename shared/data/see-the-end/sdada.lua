local shadersEnabled = true
function onCreate() 
    if shadersEnabled then
        local var ShaderName = 'test3'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        setSpriteShader('camShader', ShaderName)
        runHaxeCode([[
           trace(game.getLuaObject('camShader').shader + ' Has Been Loaded!');
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
           trace(game.getLuaObject('Sh').shader + ' Has Been Loaded!');
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('Sh').shader)]);
        ]])
        function onUpdatePost(elapsed)
            setShaderFloat('camShader', 'iTime', os.clock())
            setShaderFloat('Sh', 'iTime', os.clock())
        end
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end