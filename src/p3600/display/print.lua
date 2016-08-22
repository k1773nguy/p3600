return function(line, column, text)
  love.graphics.print(text, column * 16, line * 16)
end
