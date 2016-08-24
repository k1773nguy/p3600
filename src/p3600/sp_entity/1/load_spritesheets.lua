require 'p3600'

return function()
  p3600.gstate.entity[1].spritesheets = {
    [0] = love.graphics.newImage('/data/spritesheet/se/1/0.tga'),
  }

  return p3600.gstate.entity[1].spritesheets[0]
end
