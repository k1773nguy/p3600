require 'p3600'

return function(items)
  p3600.slowness = 0.1
  love.keyboard.setTextInput(false)

  p3600.state = {
    selection  = 1,
    menu_items = items,
    changed = true,
    onreturn = items.onreturn,
    do_onreturn = false,
    back = items.back,
    on_draw = items.draw,
    _p = require('p3600.display.print'),
  }

  if not (items.init == nil) then
    items.init()
  end

  if (p3600.state._menu_cursor == nil) then
    local s = p3600.state_stack
    while not (s == nil) do
      if not (s.state._menu_cursor == nil) then
        p3600.state._menu_cursor = s.state._menu_cursor
        s = nil
      else
        s = s.state_stack
      end
    end

    if (p3600.state._menu_cursor == nil) then
      p3600.state._menu_cursor = love.graphics.newImage('/data/menu/cursor.tga')
    end
  end

  p3600.clear_love_callbacks()

  -- XXX: if a menu is declared with only seperators, behavior is undefined
  while not (type(p3600.state.menu_items[p3600.state.selection]) == 'table') do
    p3600.state.selection = p3600.state.selection + 1
  end

  p3600.keypressed = function(key)
    local tbl = {
      ['up'] = function()
        if (p3600.state.selection > 1) then
          local prev_selection = p3600.state.selection
          p3600.state.changed = true
          repeat
            p3600.state.selection = p3600.state.selection - 1
          until ((type(p3600.state.menu_items[p3600.state.selection])
                  == 'table') or (p3600.state.selection < 1))
          if (p3600.state.selection < 1) then
              p3600.state.changed = false
              p3600.state.selection = prev_selection
          end
        end
      end,

      ['down'] = function()
        if (p3600.state.selection < #p3600.state.menu_items) then
          local prev_selection = p3600.state.selection
          p3600.state.changed = true
          repeat
            p3600.state.selection = p3600.state.selection + 1
          until ((type(p3600.state.menu_items[p3600.state.selection])
                  == 'table') or
                 (p3600.state.selection > #p3600.state.menu_items))
          if (p3600.state.selection > #p3600.state.menu_items) then
              p3600.state.changed = false
              p3600.state.selection = prev_selection
          end
        end
      end,

      ['select'] = function()
        p3600.state.changed = true
        p3600.state.do_onreturn = true
        p3600.state.menu_items[p3600.state.selection].action()
      end,

      ['back'] = function()
        if not (p3600.state.back == nil) then
          p3600.state.changed = true
          p3600.state.back()
        end
      end,
    }
    tbl['left'] = tbl['back']
    tbl['right'] = tbl['select']
    if not (p3600.kb.m[key] == nil) then
      if not (tbl[p3600.kb.m[key]] == nil) then
        tbl[p3600.kb.m[key]]()
      end
    end
  end

  p3600.update = function(dt)
    if (p3600.state.do_onreturn) and (not (p3600.state.onreturn == nil)) then
      p3600.state.onreturn()
    end
  end

  p3600.draw = function()
    if (p3600.state.changed) then
      love.graphics.clear()

      love.graphics.setColor(255, 255, 255, 255)
      for i, e in ipairs(p3600.state.menu_items) do
        if not (type(e) == 'table') then
          love.graphics.setColor(200, 200, 200, 255)
          if (type(e) == 'function') then
            p3600.state._p(16 + i, 1, e())
          else
            p3600.state._p(16 + i, 1, e)
          end
          love.graphics.setColor(255, 255, 255, 255)
        else
          if (i == p3600.state.selection) then
            love.graphics.setColor(255, 0, 0, 255)
            if (type(e.label) == 'function') then
              p3600.state._p(16 + i, 4, e.label())
            else
              p3600.state._p(16 + i, 4, e.label)
            end
            love.graphics.setColor(255, 255, 255, 255)

            love.graphics.draw(p3600.state._menu_cursor, 2 * 16,
                               (16 + i) * 16)
          else
            if (type(e.label) == 'function') then
              p3600.state._p(16 + i, 4, e.label())
            else
              p3600.state._p(16 + i, 4, e.label)
            end
          end
        end
      end

      if not (p3600.state.on_draw == nil) then
        p3600.state.on_draw()
      end

      p3600.state.changed = false
      p3600.display.changed = true
    end
  end
end
