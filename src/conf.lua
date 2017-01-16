function love.conf(t)
  t.game = {
    version = 'none', -- Configuration version.

    invert_run = false, -- If true, hold the 'run' key to walk.

    -- Can be set to anything in that directory.
    keybinds = require('default_keybinds.pc_qwerty'),
  }

  t.console = false                   -- Attach a console (boolean, Windows only)

  t.externalstorage = true            -- True to save files (and read from the save directory) in external storage on Android (boolean) 

  t.window.width = 640                -- The window width (number)
  t.window.height = 480               -- The window height (number)
  t.window.borderless = false         -- Remove all border visuals from the window (boolean)
  t.window.minwidth = 10              -- Minimum window width (number)
  t.window.minheight = 10             -- Minimum window height (number)
  t.window.fullscreen = false         -- Enable fullscreen (boolean)
  t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
  t.window.vsync = true               -- Enable vertical sync (boolean)
  t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
  t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)
  t.window.display = 1                -- Index of the monitor to show the window in (number)
  t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
  t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
  t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

  -- only developers will need to change the values below

  t.identity = 'p3600'                -- The name of the save directory (string)
  t.version = "0.10.1"                -- The LÖVE version this game was made for (string)
  t.accelerometerjoystick = false     -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
  t.window.title = "p3600"            -- The window title (string)
  -- t.window.icon should be unset; the icon is handled elsewhere
  t.window.resizable = true           -- Let the window be user-resizable (boolean)

  -- optional modules
  t.modules.joystick = false
  t.modules.mouse    = false
  t.modules.touch    = false
  t.modules.window   = true

  -- required modules
  t.modules.event    = true
  t.modules.graphics = true
  t.modules.image    = true
  t.modules.keyboard = true
  t.modules.math     = true
  t.modules.timer    = true

  -- unused modules
  t.modules.audio    = false
  t.modules.physics  = false
  t.modules.sound    = false
  t.modules.system   = false
  t.modules.thread   = false
  t.modules.video    = false
end
