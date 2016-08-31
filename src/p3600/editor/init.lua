require 'p3600'

return function(area_name, full)
  p3600.clear_love_callbacks()

  p3600.state = {
    changed = true,
    map_changed = true,
    name = area_name,
    rmbg = require('p3600.display.render_map_bg'),
    rmfg = require('p3600.display.render_map_fg'),

    show_fg = true,
    show_bg = true,
  }

  if not (area_name == nil) then
    p3600.state.map = require('p3600.area.'..area_name..'.data')
  end

  p3600.slowness = 0.1

  p3600.keypressed = function(key)
    local tbl = {
      ['exit'] = function()
        p3600.state.changed = true
        p3600.push_state()

        require('p3600.display.menu')({
          back = p3600.pop_state,

          'Are you sure you want to exit?',

          {
            label = 'No',
            action = function()
              p3600.pop_state()
            end,
          },

          {
            label = 'Yes',
            action = function()
              p3600.pop_state()
              p3600.pop_state()
            end,
          },
        })
      end
    }
    if
     (not (p3600.kb.e[key] == nil)) and
     (not (tbl[p3600.kb.e[key]] == nil))
    then
      tbl[p3600.kb.e[key]]()
    end
  end

  p3600.update = function(dt)
    if (p3600.state.map_changed) then
      p3600.state.cached_map =
       require('p3600.display.make_map')(p3600.state.map)
      p3600.state.changed = true
      p3600.state.map_changed = false
    end
  end

  p3600.draw = function()
    if (p3600.state.changed) and (not (p3600.state.map_changed)) then
      love.graphics.clear()

      if (p3600.state.show_bg) then
        p3600.state.rmbg(p3600.state.cached_map)
      end

      if (p3600.state.show_fg) then
        p3600.state.rmfg(p3600.state.cached_map)
      end

      p3600.display.changed = true
      p3600.state.changed = false
    end
  end

  if (full) then
    love.window.setTitle('p3600 map editor')

    if (area_name == nil) then
      p3600.push_state()
      p3600.clear_love_callbacks()

      p3600.state = {
        drawn = false,
        done = false,
      }

      p3600.slowness = 0.1

      p3600.draw = function()
        if (p3600.state.done) then
          return
        else
          love.graphics.clear()
          require('p3600.display.print')(5, 5, 'Enter area: ')
          require('p3600.display.print')(3, 6, '(leave blank for list)')
          p3600.state.drawn = true
          p3600.display.changed = true
        end
      end

      p3600.update = function(dt)
        if (p3600.state.done) then
          p3600.pop_state()
        elseif (p3600.state.list) then
          local areas = love.filesystem.getDirectoryItems('/p3600/area')
          local m = {}
          local load_area = function()
            local n = p3600.state.menu_items[p3600.state.selection].label
            p3600.pop_state()
            p3600.state.name = n
            p3600.state.map = require('p3600.area.'..n..'.data')
          end
          for i,n in pairs(areas) do
            if not (n == 'init.lua') then
              m[i] = {
                label = n,
                action = load_area,
              }
            end
          end
          require('p3600.display.menu')(m)
        elseif (p3600.state.drawn) then
          local f = function(s)
            if (s == '') then
              p3600.state.list = true
            else
              p3600.state_stack.state_stack.state.name = s
              p3600.state_stack.state_stack.state.map =
               require('p3600.area.'..s..'.data')
              p3600.state.done = true
            end
          end
          require('p3600.display.text_input')(5, 17, f, '',
                                              {r = 0, b = 0, g = 0})
        end
      end
    end
  end
end
