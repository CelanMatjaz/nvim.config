local mappings = {
    { "<C-b>", "<cmd> enew <cr>", { desc = "Create buffer" } },
    { "<C-x>", "<cmd> bd <cr>", { desc = "Delete buffer" } },
    { "<C-X>", "<cmd> bunload <cr>", { desc = "Delete ALL buffers" } },

    { "<tab>", "<cmd> bnext <cr>", { desc = "Next buffer" } },
    { "<S-tab>", "<cmd> bprevious <cr>", { desc = "Previous buffer" } },

    { "<C-c>", "<esc>", { desc = "Exit to normal mode" } , "i"},
    { "<C-s>", "<cmd> w <cr>", { desc = "Save buffer" } },
    
    { "<C-h>", "<Left>", {}, "i" },
    { "<C-l>", "<Right>", {}, "i" },
    { "<C-j>", "<Down>", {}, "i" },
    { "<C-k>", "<Up>", {}, "i" },
    
    { "<C-h>", "<cmd> TmuxNavigateLeft <cr>" },
    { "<C-j>", "<cmd> TmuxNavigateDown <cr>" },
    { "<C-k>", "<cmd> TmuxNavigateUp <cr>" },
    { "<C-l>", "<cmd> TmuxNavigateRight <cr>" },
    { "<c-\\>", "<cmd> TmuxNavigatePrevious <cr>" },

    { "<C-n>", "<cmd> NvimTreeToggle <cr> " },
}

require "plugins.utils".add_mappings(mappings)
