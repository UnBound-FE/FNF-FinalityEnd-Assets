function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
end
function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
end
