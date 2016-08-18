
function love.conf(t)
    t.console = false                   -- Attach a console (boolean, Windows only)

    t.externalstorage = true            -- True to save files (and read from the save directory) in external storage on Android (boolean) 

    t.window.width = 800                -- The window width (number)
    t.window.height = 600               -- The window height (number)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.minwidth = 1               -- Minimum window width (number)
    t.window.minheight = 1              -- Minimum window height (number)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)
    t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
    t.window.vsync = true               -- Enable vertical sync (boolean)
    t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
    t.window.display = 1                -- Index of the monitor to show the window in (number)
    t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
    t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
    t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

    -- only developers will need to change the values below

    t.identity = 'p3600'                -- The name of the save directory (string)
    t.version = "0.10.1"                -- The LÖVE version this game was made for (string)
    t.accelerometerjoystick = false     -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
    t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)
    t.window.title = "p3600"            -- The window title (string)
    t.window.icon = '/data/icon.tga'    -- Filepath to an image to use as the window's icon (string)
    t.window.resizable = true           -- Let the window be user-resizable (boolean)

    t.modules.audio    = false
    t.modules.event    = true
    t.modules.graphics = true
    t.modules.image    = true
    t.modules.joystick = false
    t.modules.keyboard = true
    t.modules.math     = false
    t.modules.mouse    = false
    t.modules.physics  = false
    t.modules.sound    = false
    t.modules.system   = false
    t.modules.timer    = true
    t.modules.touch    = false
    t.modules.video    = false
    t.modules.window   = true
    t.modules.thread   = false
end
