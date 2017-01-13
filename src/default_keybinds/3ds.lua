-- <https://github.com/VideahGams/LovePotion>

-- I don't think the "SELECT" button's name means anything anymore...
-- Come to think of it, neither does "START"...

-- Don't use circle pad for precision stuff. (By default, anyway.)
-- It's easy to go left or right when you only meant to go up or down.

-- TODO: I don't own a circle pad PRO, so I don't know what to do with
-- this "C-Stick".

return {
  menu = {
    ['up']           = 'up',
    ['cpadup']       = 'up',

    ['down']         = 'down',
    ['cpaddown']     = 'down',

    ['left']         = 'left',
    ['cpadleft']     = '(unbound)',

    ['right']        = 'right',
    ['cpadright']    = '(unbound)',

    ['a']            = 'select',

    ['b']            = 'back',

    ['cstickup']     = '(unbound)',
    ['cstickdown']   = '(unbound)',
    ['cstickleft']   = '(unbound)',
    ['cstickright']  = '(unbound)',
    ['x']            = '(unbound)',
    ['y']            = '(unbound)',
    ['start']        = '(unbound)',
    ['select']       = '(unbound)',
    ['lbutton']      = '(unbound)',
    ['rbutton']      = '(unbound)',
    -- KEY_ZL seems like a mistake
    -- KEY_ZR seems like a mistake
  },
}
