local menu = require('game.display.menu')

return function()
  game.init_state()
  game.push_state()

  local exit = function()
    return love.event.quit(0)
  end

  menu{
    init = function()
      game.state.new_game = {
        start = false,
      }
    end,

    back = exit,

    {
      label = 'New Game',
      --action = require('p3600.main_menu.new_game'),
      action = exit,
    },

    {
      label = 'Load Game',
      --action = require('p3600.main_menu.load_game'),
      action = exit,
    },

    {
      label = 'Exit',
      action = exit,
    },
  }
end
