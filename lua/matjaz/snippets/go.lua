local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("go", {
    s("iferr", {
        t("if err != nil {\t"),
        i(1, "\n"),
        t("}")
    }),
})
