return function()
  p3600.push_state()

  p3600.clear_love_callbacks()
  p3600.slowness = 0.5
  p3600.state = {
    r = p3600.state_stack.state.r,
    race = p3600.state_stack.state.race,
    changed = true,
  }

  p3600.keypressed = function(key)
    local tbl = {
      ['left'] = function()
      end,

      ['right'] = function()
      end,

      ['return'] = function()
      end,

      ['escape'] = function()
        p3600.pop_state()
      end,
    }
    if not (tbl[key] == nil) then
      tbl[key]()
    end
  end

  p3600.draw = function()
    if (p3600.state.changed) then
      love.graphics.clear()
      p3600.display.print(4, 4, 'Race: '..r[p3600.state.race].singular)
      p3600.display.changed = true
      p3600.state.changed = false
    end
  end
end
