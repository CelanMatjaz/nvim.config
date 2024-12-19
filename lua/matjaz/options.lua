-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse
vim.opt.mouse = "a"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

vim.opt.shortmess:append "sI"
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250

vim.opt.undofile = true

-- Text wrapping
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.whichwrap:append "<>[]hl"

-- Other
vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.laststatus = 3

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
