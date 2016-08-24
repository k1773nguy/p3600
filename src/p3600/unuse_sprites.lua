require 'p3600'

return function()
  if not (p3600.state._sprites_used == nil) then
    for eid,v in pairs(p3600.state._sprites_used) do
      p3600.sprite_refs[eid] = p3600.sprite_refs[eid] - 1

      if (p3600.sprite_refs[eid] < 1) then
        p3600.sprite_refs[eid] = nil
        p3600.gstate.entity[eid].spritesheet = nil
        p3600.gstate.entity[eid].sprite_quad = nil
        if (p3600.gstate.entity[eid].special) then
          require('p3600.sp_entity.'..eid..'.unload_spritesheets')()
        end
      end
    end
  end
end
