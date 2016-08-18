require 'p3600'

return function()
  p3600.slowness = 0.01

  p3600.draw = function()
    love.event.quit(0)
  end
end
