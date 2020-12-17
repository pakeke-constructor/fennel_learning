


_G.id = function(val) return val end


local fennel = require("fennel.fennel")

print(fennel.searcher)
for i,v in pairs(fennel.searcher)do print("::: ", i,v) end

table.insert(package.loaders or package.searchers, fennel.searcher)

require("gravity")

do return end

