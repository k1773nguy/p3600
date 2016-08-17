return function(save_state, items)
    if (save_state) then
        p3600.push_state()
    end

    p3600.state = {
        selection  = 0,
        menu_items = items,
        changed = true,
    }

    p3600.clear_love_callbacks()

    p3600.keypressed = function(key)
        p3600.state.changed = true
        local tbl = {
            ['up'] = function()
            end,
        }
        if not (tbl[key] == nil) then
            tbl[key]()
        end
    end

    p3600.draw = function()
        if (p3600.state.changed) then
            love.graphics.clear()
            love.graphics.print("Hello World", 400, 300)
            p3600.state.changed = false
        end
    end
end
