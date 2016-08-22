return function(tbl)
  local r = {}
  for k, v in pairs(tbl) do
    r[v] = k
  end
  return r
end
