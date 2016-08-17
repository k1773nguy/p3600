require 'p3600'

function p3600.display.print(line, column, text)
    love.graphics.print(text, column * 16, line * 16)
end
