require 'p3600'
require 'p3600.display.menu'
require 'p3600.display.text_input'

return function()
  p3600.push_state()
  p3600.display.menu({
    init = function()
      p3600.state.name = ''
    end,

    [0] = {
      label = function()
        return 'Name: '..p3600.state.name
      end,
      action = function()
        local setname = function(str)
          p3600.state.name = str
        end
        p3600.display.text_input(17, 10, setname, p3600.state.name,
                                 {r = 0, b = 0, g = 0})
      end,
    },

    [1] = '',

    [2] = 'All done?',

    [3] = {
      label = 'Wake up...',
      action = function()
        p3600.state_stack.state.new_game.start = true
        p3600.gstate = {
          entity = {
            [0] = {
              name = p3600.state.name,
              pos = {
                x = 11,
                y = 11,
              },
            },
          },
        }
        p3600.pop_state()
      end,
    },

    [4] = {
      label = 'Keep sleeping (abort)',
      action = function()
        p3600.pop_state()
      end,
    },
  })
end
