return function(f, tbl, indent)
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
          if not (v._no_save) then
            f:write(s)
            save_r(i..'  ', v)
            f:write(",\n")
          end
        else
          f:write(s..value_format[type(v)](v))
          f:write(",\n")
        end
      end
    end

    f:write(i..'}')
  end

  return save_r(indent or '', tbl)
end
