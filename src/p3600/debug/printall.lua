return function(tbl)
  local format_tbl = {
    ['string'] = function(v)
      return '"'..v..'"'
    end,
  }

  local printall
  printall = function(i, t)
    for k,v in pairs(t) do
      local s = i

      s = s..tostring(k)..' = '

      if not (format_tbl[type(v)] == nil) then
        s = s..format_tbl[type(v)](v)
      else
        s = s..tostring(v)
      end

      print(s)

      if (type(v) == 'table') then
        printall(i..'  ', v)
      end
    end
  end

  printall('', tbl)
end
