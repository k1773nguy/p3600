require 'p3600'

--[[
Reads a line of text, displaying the cursor at (line, column).
Calls setstr(str), where str is the string that was read.

If initial_string is passed, that is what the buffer starts with.

Does not modify the state. (setstr can modify the current state)
Uses p3600.{push,pop}_state to change love callbacks only.
]]
function p3600.display.text_input(line, column, setstr, initial_string)
  p3600.push_state()
  p3600.clear_love_callbacks()

  p3600.text_input_r = line
  p3600.text_input_c = column
  p3600.text_input_buffer = initial_string or ''
  p3600.text_input_buffer_changed = true
  p3600.text_input_setstr = setstr
  p3600.text_input_old_buffer = p3600.display.buffer
  p3600.display.buffer = love.graphics.newCanvas(800, 600, 'rgb5a1', 0)

  love.keyboard.setTextInput(true)

  p3600.textinput = function(text)
    p3600.text_input_buffer = p3600.text_input_buffer..text
    p3600.text_input_buffer_changed = true
  end

  p3600.keypressed = function(key)
    local tbl = {
      ['backspace'] = function()
        local utf8 = require('utf8')
        local offs = utf8.offset(p3600.text_input_buffer, -1)
        if offs then
          p3600.text_input_buffer = string.sub(p3600.text_input_buffer,
                                               1, offs - 1)
          p3600.text_input_buffer_changed = true
        end
      end,

      ['return'] = function()
        p3600.display.buffer = p3600.text_input_old_buffer
        p3600.text_input_setstr(p3600.text_input_buffer)

        p3600.text_input_r = nil
        p3600.text_input_c = nil
        p3600.text_input_buffer = nil
        p3600.text_input_buffer_changed = nil
        p3600.text_input_setstr = nil
        p3600.text_input_old_buffer = nil

        local s = p3600.state
        p3600.pop_state()
        p3600.state = s
      end,
    }
    if not (tbl[key] == nil) then
      tbl[key]()
    end
  end

  p3600.draw = function()
    if (p3600.text_input_buffer_changed) or (p3600.display.changed) then
      love.graphics.clear()
      love.graphics.draw(p3600.text_input_old_buffer)
      p3600.display.print(p3600.text_input_r, p3600.text_input_c,
                          p3600.text_input_buffer)
      p3600.text_input_buffer_changed = false
      p3600.display.changed = true
    end
  end

  p3600.update = function(dt)
    love.timer.sleep(0.05)
  end
end
