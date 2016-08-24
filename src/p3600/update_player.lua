return function(dt)
  local pc = p3600.gstate.entity[0]

  local speed
  local frame_time

  if (p3600.cfg.invert_run) then
    speed = (0.05 * pc.speed_mod) * 2
    frame_time = (speed * 6) / 2
    if (love.keyboard.isDown(p3600.state.k['run'])) then
      speed = speed / 2
      frame_time = frame_time * 2
    end
  else
    speed = 0.05 * pc.speed_mod
    frame_time = speed * 6
    if (love.keyboard.isDown(p3600.state.k['run'])) then
      speed = speed * 2
      frame_time = frame_time / 2
    end
  end

  local is_walking = false
  local just_started_walking = false

  if (pc.can_move) then
    local function start_walking()
      pc.walking = {
        frame = 1,
        next_frame = (speed * 6),
      }
      just_started_walking = true
    end

    if (love.keyboard.isDown(p3600.state.k['up'])) then
      if (pc.pos.y > 0) then
        if (love.keyboard.isDown(p3600.state.k['left'])) or
           (love.keyboard.isDown(p3600.state.k['right']))
        then
          pc.pos.y = pc.pos.y - (speed / 2)
        else
          is_walking = true
          pc.pos.y = pc.pos.y - speed
          pc.dir = 2
          if (pc.walking == nil) then
            start_walking()
          end
        end
        p3600.state.changed = true
      end
    end

    if (love.keyboard.isDown(p3600.state.k['down'])) then
      if (pc.pos.y < p3600.state.map.height - 1) then
        if (love.keyboard.isDown(p3600.state.k['left'])) or
           (love.keyboard.isDown(p3600.state.k['right']))
        then
          pc.pos.y = pc.pos.y + (speed / 2)
        else
          is_walking = true
          pc.pos.y = pc.pos.y + speed
          pc.dir = 0
          if (pc.walking == nil) then
            start_walking()
          end
        end
        p3600.state.changed = true
      end
    end

    if (love.keyboard.isDown(p3600.state.k['left'])) then
      if (pc.pos.x > 0) then
        is_walking = true
        if (love.keyboard.isDown(p3600.state.k['up'])) or
           (love.keyboard.isDown(p3600.state.k['down']))
        then
          pc.pos.x = pc.pos.x - (speed / 2)
        else
          pc.pos.x = pc.pos.x - speed
        end
        if (pc.walking == nil) then
          start_walking()
        end
        pc.dir = 1
        p3600.state.changed = true
      end
    end

    if (love.keyboard.isDown(p3600.state.k['right'])) then
      if (pc.pos.x < p3600.state.map.width - 1) then
        is_walking = true
        if (love.keyboard.isDown(p3600.state.k['up'])) or
           (love.keyboard.isDown(p3600.state.k['down']))
        then
          pc.pos.x = pc.pos.x + (speed / 2)
        else
          pc.pos.x = pc.pos.x + speed
        end
        pc.dir = 3
        if (pc.walking == nil) then
          start_walking()
        end
        p3600.state.changed = true
      end
    end
  end

  if (is_walking) then
    if not (just_started_walking) then
      pc.walking.next_frame = pc.walking.next_frame - dt
      if (pc.walking.next_frame <= 0) then
        pc.walking.next_frame = frame_time
        pc.walking.frame = pc.walking.frame + 1
        if (pc.walking.frame > 3) then
          pc.walking.frame = 0
        end
        p3600.state.changed = true
      end
    end
  else
    pc.walking = nil
    p3600.state.changed = true
  end
end
