p3600 = {
    state = {},
    state_stack = {},
}

p3600.push_state = function()
    p3600.state_stack = {
        draw          = love.draw,
        focus         = love.focus,
        keypressed    = love.keypressed,
        keyreleased   = love.keyreleased,
        mousepressed  = love.mousepressed,
        mousereleased = love.mousereleased,
        quit          = love.quit,
        state         = p3600.state,
        state_stack   = p3600.state_stack,
        update        = love.update,
    }
end

p3600.pop_state = function()
    love.draw          = p3600.state_stack.draw
    love.focus         = p3600.state_stack.focus
    love.keypressed    = p3600.state_stack.keypressed
    love.keyreleased   = p3600.state_stack.keyreleased
    love.mousepressed  = p3600.state_stack.mousepressed
    love.mousereleased = p3600.state_stack.mousereleased
    love.quit          = p3600.state_stack.quit
    p3600.state        = p3600.state_stack.state
    p3600.state_stack  = p3600.state_stack.state_stack
    love.update        = p3600.state_stack.update
end

p3600.clear_love_callbacks = function()
    love.draw = function()
    end
    love.focus = function(f)
    end
    love.keypressed = function(key)
    end
    love.keyreleased = function(key)
    end
    love.mousepressed = function(x, y, button, istouch)
    end
    love.mousereleased = function(x, y, button, istouch)
    end
    love.quit = function()
    end
    love.update = function(dt)
    end
end
