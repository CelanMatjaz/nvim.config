local ls = require "luasnip"
local s = ls.snippet
local f = ls.function_node

local timestamp = s("timestamp", {
	f(function()
		return tostring(os.time() * 1000)
	end)
})

return { timestamp }
