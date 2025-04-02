require "matjaz.mappings.set".set_mappings({
    { "<C-b>",      "<cmd> enew <cr>", },
    { "<C-x>",      "<cmd> bdelete <cr>", },
    { "<C-X>",      "<cmd> bunload <cr>", },

    { "<tab>",      "<cmd> bnext <cr>", },
    { "<S-tab>",    "<cmd> bprevious <cr>", },

    { "<C-c>",      "<esc>",                            mode = { "i", "v" } },
    { "<C-s>",      "<cmd> w <cr>", },

    { "<C-h>",      "<Left>",                           mode = "i" },
    { "<C-l>",      "<Right>",                          mode = "i" },
    { "<C-j>",      "<Down>",                           mode = "i" },
    { "<C-k>",      "<Up>",                             mode = "i" },

    { "<C-h>",      "<cmd> TmuxNavigateLeft <cr>" },
    { "<C-j>",      "<cmd> TmuxNavigateDown <cr>" },
    { "<C-k>",      "<cmd> TmuxNavigateUp <cr>" },
    { "<C-l>",      "<cmd> TmuxNavigateRight <cr>" },
    { "<c-\\>",     "<cmd> TmuxNavigatePrevious <cr>" },

    { "<A-k>",      "<cmd> move .-2 <cr>", },
    { "<A-j>",      "<cmd> move .+1 <cr>", },

    { "<leader>bo", "<cmd> BufferLineCloseOthers <cr>", desc = "Close all other buffers" },

    { "<CA-j>",     "<S-}>",                            mode = { "i", "n" } },
    { "<CA-k>",     "<S-{>",                            mode = { "i", "n" } },
})
