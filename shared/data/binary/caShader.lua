function onCreate()
    initLuaShader('ChromaticAbberation');

    makeLuaSprite('caShader', '', 0, 0);
    setSpriteShader('caShader', 'ChromaticAbberation');
    setShaderFloat('caShader', 'amount', -0.2);
    runHaxeCode([[
        var filter:ShaderFilter = new ShaderFilter(game.getLuaObject('caShader').shader);

        game.camGame.setFilters([filter]);
    ]]);
end
