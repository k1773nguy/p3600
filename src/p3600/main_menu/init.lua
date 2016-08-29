require 'p3600'

return function()
  require('p3600.display.menu')({
    init = function()
      p3600.state.new_game = {
        start = false,
      }
    end,

    back = function()
      p3600.pop_state()
    end,

    {
      label = 'New Game',
      action = require('p3600.main_menu.new_game'),
    },

    {
      label = 'Load Game',
      action = require('p3600.main_menu.load_game'),
    },

    {
      label = 'Exit',
      action = function()
        p3600.pop_state()
      end,
    },
  })
end
