require 'p3600'

return function(init) -- init is only true if called from intro
  if (init) then
    p3600.gstate.entity[1] = require('p3600.sp_entity.1')
  else
    local prev_area = p3600.gstate.entity[0].pos.area
    p3600.gstate.entity[0].pos.area = 'clearing'

    local pf_x
    local pf_y

    if (prev_area == 'forest1') then
      p3600.gstate.entity[0].pos.x = 2
      p3600.gstate.entity[0].pos.y = 9
      return 2, 10
    else
      p3600.gstate.entity[0].pos.x = 9
      p3600.gstate.entity[0].pos.y = 9
      return 9, 10
    end
  end
end
