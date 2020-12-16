


_G.id = function(val) return val end


local fennel = require("fennel.fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)

require("gravity")

do return end

