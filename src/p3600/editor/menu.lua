require 'p3600'

return function()
  p3600.state.changed = true -- have to redraw

  local m = {
    back = p3600.pop_state,
  }

  m[#m + 1] = 'Tile'

  m[#m + 1] = {
    label = 'Set foreground',
    action = p3600.pop_state,
  }

  m[#m + 1] = {
    label = 'Set background',
    action = p3600.pop_state,
  }

  m[#m + 1] = ''

  m[#m + 1] = 'Map'

  m[#m + 1] = '   Toggle foreground'
  m[#m + 1] = '   Toggle background'

  m[#m + 1] = {
    label = 'Save',
    action = function()
      p3600.pop_state()
      love.filesystem.createDirectory('/p3600/area/'..p3600.state.name)
      local f = love.filesystem.newFile('/p3600/area/'..p3600.state.name..
                                        '/data.lua', 'w')
      f:write('return ')
      do
        local key_format = {
          ['string'] = function(v)
            return "['"..v.."']"
          end,

          ['number'] = function(v)
            return '['..v..']'
          end,
        }

        local value_format = {
          ['string'] = function(v)
            return '[['..v..']]'
          end,

          ['number'] = function(v)
            return v
          end,

          ['boolean'] = function(v)
            if (v) then
              return 'true'
            else
              return 'false'
            end
          end,

          ['table'] = true,
        }

        local save_r
        save_r = function(i, t)
          f:write("{\n")

          for k,v in pairs(t) do
            if
             (not (value_format[type(v)] == nil)) and
             (not (key_format[type(k)] == nil))
            then
              local s = i..'  '

              s = s..key_format[type(k)](k)..' = '

              if (type(v) == 'table') then
                f:write(s)
                save_r(i..'  ', v)
                f:write(",\n")
              else
                f:write(s..value_format[type(v)](v))
                f:write(",\n")
              end
            end
          end

          f:write(i..'}')
        end

        save_r('', p3600.state.map)
        f:write("\n")
      end

      f:flush()
      f:close()
    end,
  }

  p3600.push_state()
  require('p3600.display.menu')(m)
end
