require 'p3600'

return function(can_save)
  local i = {
    back = function()
      p3600.pop_state()
    end,

    [0] = {
      label = 'Continue',
      action = function()
        p3600.pop_state()
      end,
    },

    [1] = {
      label = 'Save Game',
      action = function()
        -- TODO
        p3600.state.menu_items[1].label = 'SAVED'
      end,
    },

    [2] = {
      label = 'Quit',
      action = function()
        love.event.quit(0)
      end,
    },
  }

  if not (can_save) then
    i[1] = "Can't save here."
  end

  p3600.push_state()
  require('p3600.display.menu')(i)
end
