require 'p3600'

function love.load()
    p3600.init()

    require('p3600.menu')(false, {
        ['New Game'] = function()
        end,
    })
end
