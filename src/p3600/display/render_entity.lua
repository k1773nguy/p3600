return function(entity)
  if not ((entity.pos.x) and (entity.pos.y)) then
    return
  end

  local qy = entity.dir
  local qx = 0

  if not (entity.walking == nil) then
    if (entity.walking.frame == 0) or (entity.walking.frame == 2) then
      qx = 0
    elseif (entity.walking.frame == 1) then
      qx = 1
    elseif (entity.walking.frame == 3) then
      qx = 2
    end
  end

  entity.sprite_quad:setViewport(qx * 32, qy * 32, 32, 32)
  love.graphics.draw(entity.spritesheet, entity.sprite_quad,
                     math.floor((entity.pos.x - 1) * 32),
                     math.floor((entity.pos.y - 1) * 32))

  if not (entity.equip_sprites == nil) then
    for i, s in ipairs(entity.equip_sprites) do
      if not (i == '_no_save') then
        love.graphics.draw(s, entity.sprite_quad,
                           math.floor((entity.pos.x - 1) * 32),
                           math.floor((entity.pos.y - 1) * 32))
      end
    end
  end
end
