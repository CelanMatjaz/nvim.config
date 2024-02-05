local mappings = {
    { { "n" }, "<C-b>", "<cmd> enew <cr>", "Create buffer" },
    { { "n" }, "<C-x>", "<cmd> bunload <cr>", "Delete buffer" },
    { { "n" }, "<C-X>", "<cmd> bunload <cr>", "Delete ALL buffers" },

    { { "n" }, "<tab>", "<cmd> bnext <cr>", "Next buffer" },
    { { "n" }, "<S-tab>", "<cmd> bprevious <cr>", "Previous buffer" },

    { { "n" }, "<c-c>", "<cmd> <esc> <cr>", "Previous buffer" },
    { { "n" }, "<c-s>", "<cmd> w <cr>", "Previous buffer" },
}

require "utils".add_mappings(mappings)
