local nvimtree = require "nvim-tree"

nvimtree.setup {
    disable_netrw = true,
    update_focused_file = {
        enable = true,
        update_root = false
    },

    prefer_startup_root = true,
    
    renderer = {

        root_folder_label = "",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "󰈚",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
            },
            },
        },
    }
}
