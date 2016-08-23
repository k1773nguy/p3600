--[[
Returns a Quad for sprite (id) on a spritesheet.
If a sprite takes up more than one index, specify (h) and (w).
]]
return function(id, h, w)
  h = h or 1
  w = w or h
  local row = math.floor(id / 32)
  local col = id % 32
  return love.graphics.newQuad(col * 32, row * 32, 32 * w, 32 * h, 256, 256)
end
