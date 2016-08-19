require 'p3600'

p3600.display.menu({
  init = function()
    p3600.state.new_game = {
      start = false,
    }
  end,

  onreturn = function()
    if (p3600.state.new_game.start) then
      p3600.init_state_stack()
      require('p3600.transition.intro')()
    end
  end,

  [0] = {
    label = 'New Game',
    action = require('p3600.main_menu.new_game'),
  },

  [1] = {
    label = 'Load Game',
    action = function()
    end,
  },

  [2] = {
    label = 'Exit',
    action = function()
      p3600.pop_state()
    end,
  },
})
