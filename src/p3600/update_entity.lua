require 'p3600'

return function(eid, v, dt)
  if (eid == 0) then
    return
  end

  if (v.special) then
    require('p3600.sp_entity.'..eid..'.update')(dt)
  else
    -- TODO
  end
end
