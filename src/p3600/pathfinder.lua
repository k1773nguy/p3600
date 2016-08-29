return function(grid, sx, sy, dx, dy)
  if (grid._jumper == nil) then
    local g = require('jumper.grid')(grid)
    grid._jumper = require('jumper.pathfinder')(g, 'JPS', 0)
  end

  return grid._jumper:getPath(sx, sy, dx, dy)
end
