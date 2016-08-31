require 'p3600'

return function()
  p3600.state.changed = true -- have to redraw

  local m = {
    back = p3600.pop_state,
  }

  m[#m + 1] = 'Tile'

  m[#m + 1] = {
    label = 'Set background...',
    action = p3600.pop_state,
  }

  m[#m + 1] = {
    label = 'Set foreground...',
    action = p3600.pop_state,
  }

  m[#m + 1] = ''

  m[#m + 1] = 'Map'

  m[#m + 1] = {
    label = 'Set height',
    action = p3600.pop_state,
  }

  m[#m + 1] = {
    label = 'Set width',
    action = p3600.pop_state,
  }

  m[#m + 1] = {
    label = 'Save',
    action = p3600.pop_state,
  }

  p3600.push_state()
  require('p3600.display.menu')(m)
end
