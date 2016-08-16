require 'p3600'

function love.load()
    require('p3600.menu')(false, {
        ['New Game'] = function()
        end,
    })
end
