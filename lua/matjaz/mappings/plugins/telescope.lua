require "matjaz.mappings.set".set_mappings({
    { "<leader>ff", "<cmd> Telescope find_files <cr>",                desc = "Find files" },
    { "<leader>fg", "<cmd> Telescope live_grep <cr>",                 desc = "Live grep" },
    { "<leader>fb", "<cmd> Telescope buffers <cr>",                   desc = "Find buffers" },
    { "<leader>fh", "<cmd> Telescope help_tags <cr>",                 desc = "Help page" },
    { "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <cr>", desc = "Find in current buffer" },
    { "<leader>fs", "<cmd> Telescope lsp_document_symbols <cr>",      desc = "Find symbols in current buffer" },
    { "<leader>fa", "<cmd> Telescope treesitter <cr>",                desc = "Find symbols in current buffer" },
    { "<leader>fm", "<cmd> Telescope marks <cr>",                     desc = "Find marks" },
})
