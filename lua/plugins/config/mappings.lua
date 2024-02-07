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
    
    { "<C-h>", "<C-W>h" },
    { "<C-l>", "<C-W>l" },
    { "<C-j>", "<C-W>j" },
    { "<C-k>", "<C-W>k" },

    { "<C-n>", "<cmd> NvimTreeToggle <cr> " },
}

require "plugins.utils".add_mappings(mappings)
