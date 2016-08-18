require 'p3600'
require 'p3600.display.print'

p3600.display._menu = {}

function p3600.display.menu(items)
  p3600.slowness = 0.1
  love.keyboard.setTextInput(false)

  p3600.state = {
    selection  = 0,
    menu_items = items,
    changed = true,
    onreturn = items.onreturn,
    do_onreturn = false,
  }

  if not (items.init == nil) then
    items.init()
  end

  if (p3600.display._menu.cursor == nil) then
    p3600.display._menu.cursor = love.graphics.newImage('/data/menu/cursor.tga')
  end

  p3600.clear_love_callbacks()

  -- XXX: if a menu is declared with only seperators, behavior is undefined
  while not (type(p3600.state.menu_items[p3600.state.selection]) == 'table') do
    p3600.state.selection = p3600.state.selection + 1
  end

  p3600.keypressed = function(key)
    local tbl = {
      ['up'] = function()
        if (p3600.state.selection > 0) then
          local prev_selection = p3600.state.selection
          p3600.state.changed = true
          repeat
            p3600.state.selection = p3600.state.selection - 1
          until ((type(p3600.state.menu_items[p3600.state.selection])
                  == 'table') or (p3600.state.selection < 0))
          if (p3600.state.selection < 0) then
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

      ['return'] = function()
        p3600.state.changed = true
        p3600.state.do_onreturn = true
        p3600.state.menu_items[p3600.state.selection].action()
      end,
    }
    if not (tbl[key] == nil) then
      tbl[key]()
    end
  end

  p3600.update = function(dt)
    if (p3600.state.do_onreturn) and (not (p3600.state.onreturn == nil)) then
      p3600.state.onreturn()
    end
  end

  p3600.draw = function()
    if (p3600.state.changed) or (p3600.display.changed) then
      love.graphics.clear()

      love.graphics.setColor(255, 255, 255, 255)
      for i = 0, #p3600.state.menu_items, 1 do
        if not (type(p3600.state.menu_items[i]) == 'table') then
          love.graphics.setColor(200, 200, 200, 255)
          if (type(p3600.state.menu_items[i]) == 'function') then
            p3600.display.print(17 + i, 1, p3600.state.menu_items[i]())
          else
            p3600.display.print(17 + i, 1, p3600.state.menu_items[i])
          end
          love.graphics.setColor(255, 255, 255, 255)
        else
          if (i == p3600.state.selection) then
            love.graphics.setColor(255, 0, 0, 255)
            if (type(p3600.state.menu_items[i].label) == 'function') then
              p3600.display.print(17 + i, 4, p3600.state.menu_items[i].label())
            else
              p3600.display.print(17 + i, 4, p3600.state.menu_items[i].label)
            end
            love.graphics.setColor(255, 255, 255, 255)

            love.graphics.draw(p3600.display._menu.cursor, 2 * 16,
                               (17 + i) * 16)
          else
            if (type(p3600.state.menu_items[i].label) == 'function') then
              p3600.display.print(17 + i, 4, p3600.state.menu_items[i].label())
            else
              p3600.display.print(17 + i, 4, p3600.state.menu_items[i].label)
            end
          end
        end
      end

      p3600.state.changed = false
      p3600.display.changed = true
    end
  end
end
