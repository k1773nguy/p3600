require 'p3600'

p3600.display.menu(false, {
  init = function()
    p3600.state.new_game = {
      start = false,
    }
  end,

  onreturn = function()
    if (p3600.state.new_game.start) then
    end
  end,

  [0] = {
    label = 'New Game',
    action = require('p3600.main_menu.new_game'),
  },

  [1] = {
    label = 'Load Game',
    action = function()
      return false
    end,
  },

  [2] = {
    label = 'Exit',
    action = function()
      love.event.quit(0)
      return true
    end,
  },
})
