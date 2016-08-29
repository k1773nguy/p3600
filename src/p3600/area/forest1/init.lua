require 'p3600'

return function()
  local prev_area = p3600.gstate.entity[0].pos.area
  p3600.gstate.entity[0].pos.area = 'forest1'

  local pf_x
  local pf_y

  if (prev_area == 'clearing') then
    p3600.gstate.entity[0].pos.x = 24
    p3600.gstate.entity[0].pos.y = 9
    return 24, 10
  else
    p3600.gstate.entity[0].pos.x = 24
    p3600.gstate.entity[0].pos.y = 9
    return 24, 10
  end
end
