local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true
    }
}