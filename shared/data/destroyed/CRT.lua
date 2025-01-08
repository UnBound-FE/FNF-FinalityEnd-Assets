function onCreatePost()
	initLuaShader("crt")
	makeLuaSprite("crt")
	makeGraphic("crt", screenWidth, screenHeight)
	setSpriteShader("crt", "crt")

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("crt").shader)/*, new ShaderFilter(game.getLuaObject("crt").shader)*/]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("crt").shader)]);
	]])
end

function onUpdate(elapsed)
    setShaderFloat("vhsrgb", "iTime", os.clock())
end
