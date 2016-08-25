require 'p3600'

return function(n)
  local s = love.filesystem.load(n..'/data.lua')()
  p3600.gstate = s.gstate
  require('p3600.area.'..p3600.gstate.entity[0].pos.area)()
end
