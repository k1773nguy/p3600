return function()
  if (love.keyboard.isDown(p3600.state.k['up'])) then
    if (p3600.gstate.entity[0].pos.y > 0) then
      if (love.keyboard.isDown(p3600.state.k['left'])) or
         (love.keyboard.isDown(p3600.state.k['right']))
      then
        p3600.gstate.entity[0].pos.y = p3600.gstate.entity[0].pos.y - 0.05
      else
        p3600.gstate.entity[0].pos.y = p3600.gstate.entity[0].pos.y - 0.1
      end
      p3600.state.changed = true
    end
  end

  if (love.keyboard.isDown(p3600.state.k['down'])) then
    if (p3600.gstate.entity[0].pos.y < p3600.state.map.height - 1) then
      if (love.keyboard.isDown(p3600.state.k['left'])) or
         (love.keyboard.isDown(p3600.state.k['right']))
      then
        p3600.gstate.entity[0].pos.y = p3600.gstate.entity[0].pos.y + 0.05
      else
        p3600.gstate.entity[0].pos.y = p3600.gstate.entity[0].pos.y + 0.1
      end
      p3600.state.changed = true
    end
  end

  if (love.keyboard.isDown(p3600.state.k['left'])) then
    if (p3600.gstate.entity[0].pos.x > 0) then
      if (love.keyboard.isDown(p3600.state.k['up'])) or
         (love.keyboard.isDown(p3600.state.k['down']))
      then
        p3600.gstate.entity[0].pos.x = p3600.gstate.entity[0].pos.x - 0.05
      else
        p3600.gstate.entity[0].pos.x = p3600.gstate.entity[0].pos.x - 0.1
      end
      p3600.state.changed = true
    end
  end

  if (love.keyboard.isDown(p3600.state.k['right'])) then
    if (p3600.gstate.entity[0].pos.x < p3600.state.map.width - 1) then
      if (love.keyboard.isDown(p3600.state.k['up'])) or
         (love.keyboard.isDown(p3600.state.k['down']))
      then
        p3600.gstate.entity[0].pos.x = p3600.gstate.entity[0].pos.x + 0.05
      else
        p3600.gstate.entity[0].pos.x = p3600.gstate.entity[0].pos.x + 0.1
      end
      p3600.state.changed = true
    end
  end
end
