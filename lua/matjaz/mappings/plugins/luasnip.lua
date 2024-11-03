local ls = require "luasnip"

require "matjaz.mappings.set".set_mappings({
    { "<C-K>", function() ls.expand() end,                                        desc = "Snippet expand",        mode = { "i" } },
    { "<C-L>", function() ls.jump(1) end,                                         desc = "Snippet jump forward",  mode = { "i", "s" } },
    { "<C-J>", function() ls.jump(-1) end,                                        desc = "Snippet jump backward", mode = { "i", "s" } },
    { "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end, desc = "Snippet change",        mode = { "i", "s" } },
})
