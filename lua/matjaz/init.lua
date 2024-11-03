vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.background = "dark"

require "matjaz.options"
require "matjaz.plugins"
require "matjaz.mappings"
require "matjaz.autocommands"

local float_config = { bg = "#202020" }
vim.api.nvim_set_hl(0, "FloatBorder", float_config)
vim.api.nvim_set_hl(0, "NormalFloat", float_config)
vim.api.nvim_set_hl(0, "TelescopeNormal", float_config)
vim.api.nvim_set_hl(0, "TelescopeBorder", float_config)
