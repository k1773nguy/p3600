-- automatically unload unused modules

local package = require('package')

package.nogc = {}

for k,v in pairs(package.loaded) do
  package.nogc[k] = v
end

setmetatable(package.loaded, {__mode = 'v'})
