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

    { "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Tmux navigate left" } },
    { "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "Tmux navigate down" } },
    { "<C-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "Tmux navigate up" } },
    { "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "Tmux navigate right" } },
    { "<c-\\>", "<cmd> TmuxNavigatePrevious <cr>", { desc = "Tmux navigate previous" } },

    { "<C-n>", "<cmd> NvimTreeToggle <cr>" },

    { "<leader>cc", "<cmd> Centerpad <cr>" },
    { "<leader>cx", "<cmd> Centerpad <cr>" },

    { "<A-k>", "<cmd> move .-2 <cr>", {} },
    { "<A-j>", "<cmd> move .+1 <cr>", {} },

    { "<leader>bo", "<cmd> BufferLineCloseOthers <cr>", { desc = "Close all other buffers from bufferline" } },
}

require "plugins.utils".add_mappings(mappings)
