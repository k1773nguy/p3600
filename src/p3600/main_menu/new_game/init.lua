require 'p3600'

return function()
  p3600.push_state()
  require('p3600.display.menu')({
    init = function()
      p3600.state.r = require('p3600.race')
      p3600.state.name = ''
      p3600.state.race = 0
    end,

    back = function()
      p3600.pop_state()
    end,

    [0] = {
      label = function()
        return 'Name: '..p3600.state.name
      end,
      action = function()
        local setname = function(str)
          p3600.state.name = str
        end
        require('p3600.display.text_input')(17, 10, setname, p3600.state.name,
                                            {r = 0, b = 0, g = 0})
      end,
    },

    [1] = {
      label = function()
        return 'Race: '..p3600.state.r[p3600.state.race].singular
      end,
      action = require('p3600.main_menu.new_game.race'),
    },

    [2] = '',

    [3] = 'All done?',

    [4] = {
      label = 'Wake up...',
      action = function()
        p3600.state_stack.state.new_game.start = true
        p3600.gstate = {
          entity = {
            [0] = {
              name = p3600.state.name,
              race = p3600.state.race,
              sex = 1,
              pos = {
                x = 11,
                y = 12,
              },
              speed_mod = 1,
              dir = 1,
              can_move = true,
            },
          },
        }
        p3600.pop_state()
      end,
    },

    [5] = {
      label = 'Keep sleeping (abort)',
      action = function()
        p3600.pop_state()
      end,
    },
  })
end
