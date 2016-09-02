require 'p3600'

return function(eid)
  if (p3600.state._sprites_used == nil) then
    p3600.state._sprites_used = {}
  end

  if (p3600.state._sprites_used[eid] == nil) then
    p3600.state._sprites_used[eid] = true

    if not (p3600.sprite_refs[eid] == nil) then
      p3600.sprite_refs[eid] = p3600.sprite_refs[eid] + 1
    else
      p3600.sprite_refs[eid] = 1

      do
        es = {
          _no_save = true,
        }

        for idx, item in ipairs(p3600.gstate.entity[eid].inventory.wearing) do
          es[idx] = love.graphics.newImage('/data/spritesheet/r/'..
                                           p3600.gstate.entity[eid].race..
                                           '/equip/'..item.id..'/'..
                                           p3600.gstate.entity[eid].sex..'.tga')
        end

        p3600.gstate.entity[eid].equip_sprites = es
      end

      local ss
      if (eid == 0) then
        local sn = '/save/'..p3600.gstate.entity[0].name..'/player.png'
        if (love.filesystem.exists(sn)) then
          ss = love.graphics.newImage(sn)
        else
          ss = love.graphics.newImage('/data/spritesheet/r/'..
                                      p3600.gstate.entity[eid].race..'/p/'..
                                      p3600.gstate.entity[eid].sex..'.tga')
        end
      elseif (p3600.gstate.entity[eid].special) then
        ss = require('p3600.sp_entity.'..eid..'.load_spritesheets')()
      else
        ss = love.graphics.newImage('/data/spritesheet/r/'..
                                    p3600.gstate.entity[eid].race..'/'..
                                    p3600.gstate.entity[eid].sex..'.tga')
      end

      p3600.gstate.entity[eid].spritesheet = ss
      p3600.gstate.entity[eid].sprite_quad =
       love.graphics.newQuad(0, 0, 32, 32, ss:getWidth(), ss:getHeight())
    end
  end
end
