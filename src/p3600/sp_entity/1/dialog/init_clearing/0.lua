require 'p3600'

return function()
  p3600.push_state()
  require('p3600.display.dialog')({
    can_skip = false,

    text = {
      'Hi there!',
      "You were out for quite a while, I thought I'd",
      'lost you!',
    },

    choices = {
      {
        label = 'Where am I?',
        action = function()
          require('p3600.display.end_dialog')()
          p3600.pop_state()
        end,
      },

      {
        label = 'b',
        action = function()
          require('p3600.display.end_dialog')()
          p3600.pop_state()
        end,
      },
    },
  })
end
