require 'p3600'
require 'p3600.display.render_map'
require 'p3600.display.make_map'

return function(init) -- init is only true if called from intro
  p3600.clear_love_callbacks()

  p3600.slowness = 0.01

  p3600.state = {
    map = p3600.display.make_map(require('p3600.area.clearing.data')),
    changed = true,
  }

  p3600.draw = function()
    if (p3600.state.changed) then
      love.graphics.clear(love.graphics.getBackgroundColor())
      p3600.display.render_map_bg(p3600.state.map)
      p3600.display.render_map_fg(p3600.state.map)
      p3600.display.changed = true
      p3600.state.changed = false
    end
  end
end
