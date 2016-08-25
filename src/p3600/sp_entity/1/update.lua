require 'p3600'

return function(dt)
  if (p3600.gstate.entity[1].progress.main == 0) then
    p3600.gstate.entity[1].progress.main = 1
    p3600.gstate.entity[0].can_move = true
    require('p3600.sp_entity.1.dialog.init_clearing.0')()
  end
end
