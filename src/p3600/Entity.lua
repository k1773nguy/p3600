local races = require('p3600.races')

local Entity = require('Object').new_class('Entity')
Entity._is_object = 'p3600.Entity'

function Entity._new(params)
  assert(params.race)

  local r = {
    _is_object = Entity._is_object,
  }

  for k,v in pairs(params) do
    r[k] = v
  end

  if (r.sex == nil) then
    local random = require('math').random

    local t = {}
    for k,_ in pairs(races[r.race].natural_sexes) do
      t[#t + 1] = k
    end

    r.sex = t[random(#t)]
  end

  setmetatable(r, Entity)
  return r
end

return Entity
