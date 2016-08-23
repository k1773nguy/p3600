return function(entity)
  local qy = entity.dir
  local qx = 0
  entity.sprite_quad:setViewport(qx * 32, qy * 32, 32, 32)
  love.graphics.draw(entity.spritesheet, entity.sprite_quad,
                     math.floor(entity.pos.x * 32),
                     math.floor(entity.pos.y * 32))
end
