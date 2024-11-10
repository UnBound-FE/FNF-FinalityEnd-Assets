local vuradoHI = 0x010101

local fs, mx = false, false

function onCreatePost()
    addHaxeLibrary('Lib', 'openfl')
    fs = getPropertyFromClass('openfl.Lib', 'application.window.fullscreen')
    mx = getPropertyFromClass('openfl.Lib', 'application.window.maximized')
    runHaxeCode([[
        Lib.application.window.borderless = true;
        Lib.application.window.maximized = false;
        Lib.application.window.fullscreen = false;
    ]])
end

local ffi = require("ffi")
function onEvent(n, v1)
    if buildTarget ~= 'windows' then
        onDestroy = function () end
        ffi, fs, mx = nil, nil, nil
        return
    end
    ffi.cdef([[
        typedef void* HWND;
        typedef int BOOL;
        typedef unsigned char BYTE;
        typedef unsigned long DWORD;
        HWND GetActiveWindow();
        long SetWindowLongA(HWND hWnd, int nIndex, long dwNewLong);
        BOOL SetLayeredWindowAttributes(HWND hwnd, DWORD crKey, BYTE bAlpha, DWORD dwFlags);
    ]])
    local hwnd = ffi.C.GetActiveWindow()
    ffi.C.SetWindowLongA(hwnd, -20, 0x00080000)
    if v1 == 'trans' then
        ffi.C.SetLayeredWindowAttributes(hwnd, vuradoHI, 0, 0x00000001)
    else
        ffi.C.SetLayeredWindowAttributes(hwnd, 0x070707, 0, 0x00000001)
    end
end

function onDestroy()
    ffi.C.SetWindowLongA(ffi.C.GetActiveWindow(), -20, 0x00000000)
    setPropertyFromClass('openfl.Lib', 'application.window.borderless', false)
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', fs)
    setPropertyFromClass('openfl.Lib', 'application.window.maximized', mx)
end