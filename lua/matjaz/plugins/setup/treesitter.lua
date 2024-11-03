local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "go" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = {
        enable = false,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
    }
}
