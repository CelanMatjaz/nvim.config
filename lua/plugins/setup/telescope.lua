local telescope = require('telescope')

telescope.setup {
    defaults = {
        mappings = {
            i = {
            }
        }
    },
    pickers = { 
    },
    extensions = {
    }
}

local builtin = require("telescope.builtin")
local mappings = {
    -- { nil, "<leader>f", { name = "Telescope" } },
    { { "n" }, "<leader>ff", "<cmd> Telescope find_files <cr>", "Find files" },
    { { "n" }, "<leader>fg", builtin.live_grep, "Live grep" },
    { { "n" }, "<leader>fb", builtin.buffers, "Find buffers" },
    { { "n" }, "<leader>fh", builtin.help_tags, "Help page" },
    { { "n" }, "<leader>fh", "<cmd> Telescope current_buffer_fuzzy_find <cr>", "Find in current buffer" },
}

require "utils".add_mappings(mappings, "telescope")

telescope.setup {}
