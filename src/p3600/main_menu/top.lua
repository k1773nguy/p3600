local menu = require('game.display.menu')

return function()
  game.init_state()
  game.push_state()

  local exit = function()
    return love.event.quit(0)
  end

  menu{
    back = exit,

    {
      label = 'New Game',
      action = function()
        game.push_state()
        require('p3600.main_menu.new_game')()
      end,
    },

    {
      label = 'Load Game (NYI)',
      --action = require('p3600.main_menu.load_game'),
      action = exit,
    },

    {
      label = 'Exit',
      action = exit,
    },
  }
end
