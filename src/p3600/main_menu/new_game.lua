local dialog_simple = require('game.display.dialog_simple')

return function()
  dialog_simple{
    lines = {
      'Hello, world!',
      'Line 2',
      'Line 3',
      '',
      'End',
    },

    action = function()
      game.pop_state()
    end,
  }

  -- TODO: push state, display intro (pop state to skip)
end
