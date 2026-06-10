local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local iferr = s("iferr", {
	t("if err != nil {\t"),
	i(1, "\n"),
	t("}")
})

return { iferr }
