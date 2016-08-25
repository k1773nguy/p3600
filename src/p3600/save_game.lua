-- This was going to save stuff Minecraft-style,
-- where the files are written as they are changed.
-- That would have been extremely slow. (Like Minecraft...)

require 'p3600'

return function()
  local cp = function(src, dest)
    local s = love.filesystem.newFile(src, 'r')
    local d = love.filesystem.newFile(dest, 'w')
    d:setBuffer('none')
    while not (s:isEOF()) do
      local b,n = s:read(512)
      if not (n == 0) then
        d:write(b)
      end
    end
    s:close()
    d:flush()
    d:close()
  end

  local save_name = '/save/'..p3600.gstate.entity[0].name

  love.filesystem.createDirectory(save_name)

  do
    if (love.filesystem.exists(save_name..'/data.lua')) then
      cp(save_name..'/data.lua', save_name..'/data.lua.bak')
    end

    local f = love.filesystem.newFile(save_name..'/data.lua', 'w')

    f:write("return {\n")

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
          if (not (value_format[type(v)] == nil)) and
             (not (key_format[type(k)] == nil))
          then
            local s = i..'  '

            s = s..key_format[type(k)](k)..' = '

            if (type(v) == 'table') then
              f:write(s)
              save_r(i..'  ', v)
            else
              f:write(s..value_format[type(v)](v))
            end

            f:write(",\n")
          end
        end

        f:write(i..'}')
      end

      f:write('  gstate = ')
      save_r('  ', p3600.gstate)
      f:write(",\n")
    end

    f:write("}\n")

    f:flush()
    f:close()
  end

  if (love.filesystem.exists(save_name..'/data.lua.bak')) then
    love.filesystem.remove(save_name..'/data.lua.bak')
  end

  if not (love.filesystem.exists(save_name..'/skin.tga')) then
    local dsn = '/data/spritesheet/r/'..p3600.gstate.entity[0].race..'/p/'..
                p3600.gstate.entity[0].sex..'.tga'
    cp(dsn, save_name..'/skin.tga')
  end
end
