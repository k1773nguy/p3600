require 'p3600'

return function(init) -- init is only true if called from intro
  p3600.clear_love_callbacks()

  p3600.slowness = 0.01

  p3600.state = {
    map = require('p3600.display.make_map')(require('p3600.area.clearing.data')),
    rmbg = require('p3600.display.render_map_bg'),
    rmfg = require('p3600.display.render_map_fg'),
    k = require('p3600.reverse_aa')(p3600.kb.w),
    update_player = require('p3600.update_player'),
    changed = true,
  }

  p3600.gstate.entity[0].pos.area = 'clearing'

  p3600.keypressed = function(key)
    local tbl = {
      ['pause'] = function()
        p3600.state.changed = true
        require('p3600.pause')(true)
      end,
    }

    if not (p3600.kb.w[key] == nil) then
      if not (tbl[p3600.kb.w[key]] == nil) then
        tbl[p3600.kb.w[key]]()
      end
    end
  end

  p3600.update = function(dt)
    p3600.state.update_player()
  end

  p3600.draw = function()
    if (p3600.state.changed) then
      love.graphics.clear(love.graphics.getBackgroundColor())
      p3600.state.rmbg(p3600.state.map)
      love.graphics.print('@', math.floor(p3600.gstate.entity[0].pos.x * 16), math.floor(p3600.gstate.entity[0].pos.y * 16))
      p3600.state.rmfg(p3600.state.map)
      p3600.display.changed = true
      p3600.state.changed = false
    end
  end
end
