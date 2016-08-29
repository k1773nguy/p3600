require 'p3600'

return function()
  require('p3600.display.dialog')({
    text = {
      'Okey dokey!',
      '',
      'I call it Mr. Stabby, because I can!',
    },

    choices = {
      {
        label = '...',
        action = function()
          require('p3600.display.end_dialog')()
          p3600.pop_state()
          -- TODO: give world's weakest knife
        end,
      },
    },
  })
end
