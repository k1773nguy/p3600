require 'p3600'
require 'p3600.display.menu'
require 'p3600.display.text_input'

return function()
  p3600.display.menu(true, {
    init = function()
      p3600.state.name = ''
    end,

    [0] = {
      label = 'Name:',
      action = function()
        local setname = function(str)
          p3600.state.name = str
        end
        p3600.display.text_input(17, 10, setname, p3600.state.name)
        return false
      end,
    },

    [1] = 'All done?',

    [2] = {
      label = 'Wake up...',
      action = function()
        -- TODO
        return true
      end,
    },

    [3] = {
      label = 'Keep sleeping (abort)',
      action = function()
        return true
      end,
    },
  })
  return false
end
