return function(save_state, items)
    if (save_state) then
        p3600.push_state()
    end

    p3600.state = {
        selection = 0,
    }

    p3600.clear_love_callbacks()

    love.keypressed = function(key)
        local tbl = {
            ['up'] = function()
            end,
        }
        if not (tbl[key] == nil) then
            tbl[key]()
        end
    end

    love.draw = function()
    end
end
