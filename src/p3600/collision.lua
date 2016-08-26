require 'p3600'

return function(_e)
  local f
  f = function(entity, recurse)
    local x = math.floor(entity.pos.x)
    local y = math.floor(entity.pos.y)

    local valid = false

    if (recurse == 0) then
      valid = true
    else
      local x_inc = (math.floor(entity.pos.x + 32) > x)
      local y_inc = (math.floor(entity.pos.y + 32) > y)

      if (recurse == 1) then
        if (x_inc) then
          x = x + 1
          valid = true
        end
      elseif (recurse == 2) then
        if (y_inc) then
          y = y + 1
          valid = true
        end
      else
        if (x_inc and y_inc) then
          x = x + 1
          y = y + 1
          valid = true
        end
      end
    end

    if (valid) then
      do -- entities
        local ae

        if not (p3600.state.active_entities == nil) then
          ae = p3600.state.active_entities
        else
          ae = require('p3600.get_entities_in_area')(entity.pos.area)
        end

        for i, e in pairs(ae) do
          if not (e == entity) then
            if (y == math.floor(e.pos.y)) and (x == math.floor(e.pos.x)) then
              return 'obstacle'
            end
          end
        end
      end

      do -- map
        local tiletype

        if not (p3600.state.map == nil) then
          tiletype = p3600.state.map.tiletype
        else
          tiletype = require('p3600.area.'..entity.pos.area..'.data').tiletypes
        end

        if (tiletype[y + 1][x + 1] == 1) then
          return 'obstacle'
        end
      end
    end

    if (recurse < 3) then
      return f(entity, recurse + 1)
    else
      return nil
    end
  end

  return f(_e, 0)
end
