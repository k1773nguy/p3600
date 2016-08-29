require 'p3600'

return function()
  require('p3600.display.dialog')({
    text = {
      'Okey dokey!',
      '...',
      "No, those aren't blood stains.",
      'Probably.',
    },

    choices = {
      {
        label = 'Feels like rust...',
        action = function()
          require('p3600.display.end_dialog')()
          p3600.pop_state()
          -- TODO: give neglected long sword
        end,
      },
    },
  })
end
