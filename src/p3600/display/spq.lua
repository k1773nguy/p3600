require 'p3600'

--[[
Returns a Quad for sprite (id) on a spritesheet.
If a sprite takes up more than one index, specify (h) and (w).
]]
function p3600.display.spq(id, h, w)
  h = h or 1
  w = w or h
  local row = math.floor(id / 16)
  local col = id % 16
  return love.graphics.newQuad(col * 16, row * 16, 16 * w, 16 * h, 256, 256)
end
