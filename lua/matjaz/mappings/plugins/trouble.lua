require "matjaz.mappings.set".set_mappings({
    { "<reader>td", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)" },
    { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)" },
    { "<leader>tr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
    { "<leader>tq", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)" },
    { "<leader>tw", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)" },
})
