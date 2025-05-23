require "matjaz.plugins.lazy"

require "matjaz.plugins.setup.lualine"
require "matjaz.plugins.setup.telescope"
require "matjaz.plugins.setup.mason"
require "matjaz.plugins.setup.lsp_config"
require "matjaz.plugins.setup.treesitter"
require "matjaz.plugins.setup.bufferline"
require "matjaz.plugins.setup.conform"
require "matjaz.plugins.setup.gitsigns"
require "matjaz.plugins.setup.todo_comments"
require "matjaz.plugins.setup.dap"
-- require "matjaz.plugins.setup.tabby"

require "luasnip".setup {}

require('leap').set_default_mappings()
