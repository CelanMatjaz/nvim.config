local telescope = require "telescope"

telescope.setup {
    defaults = {
        mappings = {
            i = {
            }
        },
        file_ignore_patterns = { ".cache", ".git", ".xmake" }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
    },
}

telescope.load_extension("scope")
