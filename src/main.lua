require 'p3600'
require 'p3600.display.menu'

function love.load()
  p3600.init()

  do
    local t = {}
    t.modules = {}
    t.window = {}
    love.conf(t)
    p3600.kb = {
      w = t.p3600.keybinds.world,
      m = t.p3600.keybinds.menu,
    }
  end

  require('p3600.main_menu')
end

function love.run()
  if love.math then
    love.math.setRandomSeed(os.time())
  end

  if love.load then
    love.load(arg)
  end

  if love.timer then
    love.timer.step()
  end

  local dt = 0

  while true do
    if love.event then
      love.event.pump()
      for name, a,b,c,d,e,f in love.event.poll() do
        if name == 'quit' then
          if not love.quit or not love.quit() then
            return a
          end
        end
        love.handlers[name](a,b,c,d,e,f)
      end
    end

    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end

    if love.update then
      love.update(dt)
    end

    if love.graphics and love.graphics.isActive() then
      love.graphics.origin()

      if love.draw then
        love.draw()
      end

      if (p3600.display.changed) then
        love.graphics.present()
        p3600.display.changed = false
      end
    end

    if love.timer then
      love.timer.sleep(p3600.slowness)
    end
  end
end
