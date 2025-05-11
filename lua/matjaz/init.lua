vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.background = "dark"
vim.g.loaded_matchparen = 1

require "matjaz.plugins"
require "matjaz.options"
require "matjaz.mappings"
require "matjaz.autocommands"
require "matjaz.commands"

-- Snippets
require "matjaz.snippets.utils"
require "matjaz.snippets.go"
require("luasnip.loaders.from_vscode").lazy_load()

local float_config = { bg = "#232323" }
vim.api.nvim_set_hl(0, "FloatBorder", float_config)
vim.api.nvim_set_hl(0, "NormalFloat", float_config)
vim.api.nvim_set_hl(0, "TelescopeNormal", float_config)
vim.api.nvim_set_hl(0, "TelescopeBorder", float_config)

local line_numbers = { fg = "#5f6a70" }
vim.api.nvim_set_hl(0, "LineNrAbove", line_numbers)
vim.api.nvim_set_hl(0, "LineNrBelow", line_numbers)

vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#9191AA" })

vim.cmd [[colorscheme archery]]
vim.opt.guicursor = "n-v-c-sm:block"

vim.bo.formatexpr = ""
vim.bo.formatprg = "jq"
