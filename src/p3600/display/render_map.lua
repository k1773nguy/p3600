require 'p3600'

function p3600.display.render_map_bg(map)
  love.graphics.draw(map.bg)
end

function p3600.display.render_map_fg(map)
  love.graphics.draw(map.fg)
end
