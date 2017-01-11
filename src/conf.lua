function love.conf(t)
  t.game = {
    version = 'none', -- Configuration version.

    invert_run = false, -- If true, hold the 'run' key to walk.

    -- TODO: add seperate defaults for Dvorak layouts
    keybinds = {
      world = {
        press = {
          ['c']      = 'combat',      -- Enter combat mode
          ['space']  = 'interact',    -- Interact with something
          ['e']      = 'inventory',   -- Open inventory
          ['escape'] = 'pause',       -- Pause the game
          ['pause']  = 'pause',
          ['x']      = 'toggle_slow', -- Move at half speed for more control
        },

        hold = {
          ['w']      = 'up',    -- Move up
          ['up']     = 'up',
          ['s']      = 'down',  -- Move down
          ['down']   = 'down',
          ['a']      = 'left',  -- Move left
          ['left']   = 'left',
          ['d']      = 'right', -- Move right
          ['right']  = 'right',
          ['lshift'] = 'run',   -- Move a little faster
        },
      },

      combat = {
        press = {
          ['space']  = 'attack',      -- Use your weapon
          ['escape'] = 'pause',       -- Pause the game
          ['c']      = 'end_combat',  -- Exit combat mode
          ['x']      = 'toggle_slow', -- Move at half speed for more control
        },

        hold = {
          ['w']      = 'up',    -- Move up
          ['up']     = 'up',
          ['s']      = 'down',  -- Move down
          ['down']   = 'down',
          ['a']      = 'left',  -- Move left
          ['left']   = 'left',
          ['d']      = 'right', -- Move right
          ['right']  = 'right',
          ['lshift'] = 'guard', -- Take up a defensive stance
        },
      },

      menu = {
        ['up']      = 'up',     -- Cursor up
        ['w']       = 'up',
        ['kp8']     = 'up',
        ['down']    = 'down',   -- Cursor down
        ['s']       = 'down',
        ['kp2']     = 'down',
        ['left']    = 'left',   -- Cursor left
        ['a']       = 'left',
        ['kp4']     = 'left',
        ['right']   = 'right',  -- Cursor right
        ['d']       = 'right',
        ['kp6']     = 'right',
        ['return']  = 'select', -- Do something
        ['space']   = 'select',
        ['escape']  = 'back',   -- If allowed, leave the menu
        ['appback'] = 'back',
      },
    },
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
  t.window.icon = '/data/icon.png'    -- Filepath to an image to use as the window's icon (string)
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
