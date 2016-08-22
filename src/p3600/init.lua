p3600 = {
  state = {},
  state_stack = {},
  slowness = 0.001, -- Sleeps this many seconds every tick.
  display = {
    buffer = {},
    changed = true,
    width = 800,
    height = 600,
  },
  font = {},
}

function p3600.push_state()
  p3600.state_stack = {
    draw          = p3600.draw,
    focus         = p3600.focus,
    font          = p3600.font,
    has_textinput = love.keyboard.hasTextInput(),
    keypressed    = p3600.keypressed,
    keyreleased   = p3600.keyreleased,
    mousepressed  = p3600.mousepressed,
    mousereleased = p3600.mousereleased,
    quit          = p3600.quit,
    resize        = p3600.resize,
    slowness      = p3600.slowness,
    state         = p3600.state,
    textinput     = p3600.textinput,
    update        = p3600.update,

    state_stack   = p3600.state_stack,
  }
end

function p3600.pop_state()
  p3600.draw          = p3600.state_stack.draw
  p3600.focus         = p3600.state_stack.focus
  p3600.font          = p3600.state_stack.font
  p3600.keypressed    = p3600.state_stack.keypressed
  p3600.keyreleased   = p3600.state_stack.keyreleased
  p3600.mousepressed  = p3600.state_stack.mousepressed
  p3600.mousereleased = p3600.state_stack.mousereleased
  p3600.quit          = p3600.state_stack.quit
  p3600.resize        = p3600.state_stack.resize
  p3600.slowness      = p3600.state_stack.slowness
  p3600.state         = p3600.state_stack.state
  p3600.textinput     = p3600.state_stack.textinput
  p3600.update        = p3600.state_stack.update

  love.keyboard.setTextInput(p3600.state_stack.has_textinput)

  p3600.state_stack   = p3600.state_stack.state_stack

  love.graphics.setFont(p3600.font)

  p3600.display.changed = true
end

function p3600.init_state_stack()
  local endf = function()
    love.event.quit(0)
  end

  p3600.state_stack = {
    draw          = endf,
    focus         = endf,
    font          = p3600.font,
    has_textinput = false,
    keypressed    = endf,
    keyreleased   = endf,
    mousepressed  = endf,
    mousereleased = endf,
    quit          = function()
    end,
    resize        = endf,
    slowness      = 0.1,
    state         = {},
    textinput     = endf,
    update        = endf,
    state_stack   = nil,
  }
end

function p3600.clear_love_callbacks()
  p3600.draw = function()
  end
  p3600.focus = function(f)
  end
  p3600.keypressed = function(key)
  end
  p3600.keyreleased = function(key)
  end
  p3600.mousepressed = function(x, y, button, istouch)
  end
  p3600.mousereleased = function(x, y, button, istouch)
  end
  p3600.quit = function()
  end
  p3600.resize = function(w, h)
  end
  p3600.textinput = function(text)
  end
  p3600.update = function(dt)
  end
end

p3600.clear_love_callbacks()

function love.draw()
  love.graphics.setCanvas(p3600.display.buffer)
  p3600.draw()
  love.graphics.setCanvas()
  if (p3600.display.changed) then
    love.graphics.clear(love.graphics.getBackgroundColor())
    local ratio_w = p3600.display.width / 800
    local ratio_h = p3600.display.height / 600
    local ratio = 0
    if (ratio_w < ratio_h) then
      ratio = ratio_w
    else
      ratio = ratio_h
    end
    love.graphics.translate((p3600.display.width  / 2) - ((800 * ratio) / 2),
                            (p3600.display.height / 2) - ((600 * ratio) / 2))
    love.graphics.scale(ratio)
    love.graphics.draw(p3600.display.buffer)
  end
end

function love.focus(f)
  p3600.focus(f)
  if (f) then
    p3600.display.changed = true
  end
end

function love.keypressed(key)
  p3600.keypressed(key)
end

function love.keyreleased(key)
  p3600.keyreleased(key)
end

function love.mousepressed(x, y, button, istouch)
  p3600.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
  p3600.mousereleased(x, y, button, istouch)
end

function love.quit()
  p3600.quit()
end

function love.resize(w, h)
  p3600.display.width = w
  p3600.display.height = h
  p3600.resize(w, h)
  p3600.display.changed = true
end

function love.textinput(text)
  p3600.textinput(text)
end

function love.update(dt)
  p3600.update(dt)
end

function p3600.init()
  p3600.display.buffer = love.graphics.newCanvas(800, 600, 'rgb5a1', 0)
  p3600.font = love.graphics.newImageFont('/data/font.tga',
  ' 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^'..
  '&*()-_=+[{]}\\|;:\'",<.>/?', 0)
  love.graphics.setFont(p3600.font)
  love.keyboard.setTextInput(false)
  p3600.init_state_stack()
end
