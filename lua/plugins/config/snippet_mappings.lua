local ls = require "luasnip"

require "plugins.utils".add_mappings({
    { "<C-K>", function() ls.expand() end,                                        { desc = "Snippet expand" },        { "i" } },
    { "<C-L>", function() ls.jump(1) end,                                         { desc = "Snippet jump forward" },  { "i", "s" } },
    { "<C-J>", function() ls.jump(-1) end,                                        { desc = "Snippet jump backward" }, { "i", "s" } },
    { "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end, { desc = "Snippet change" },        { "i", "s" } },
}, "LSP")
