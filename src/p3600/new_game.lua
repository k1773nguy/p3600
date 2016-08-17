return function()
  p3600.make_menu(true, {
    init = function()
      p3600.state.name = 'no name'
    end,

    [0] = {
      label = 'Name',
      action = function()
        return false
      end,
    },

    [1] = 'S',

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
