local telescope = require("telescope")

local builtin = require("telescope.builtin")
local mappings = {
    -- { nil, "<leader>f", { name = "Telescope" } },
    { "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "Find files" } },
    { "<leader>fg", "<cmd> Telescope live_grep <cr>", { desc = "Live grep" } },
    { "<leader>fb", "<cmd> Telescope buffers <cr>", { desc = "Find buffers" } },
    { "<leader>fh", "<cmd> Telescope help_tags <cr>", { desc = "Help page" } },
    { "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <cr>", { desc = "Find in current buffer" } },
}

require "plugins.utils".add_mappings(mappings, "telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = {
            }
        },
        file_ignore_patterns = { ".cache", ".git", ".xmake", "build" }
    },
    pickers = { 
    },
    extensions = {
    },
}
