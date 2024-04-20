require "plugins.setup.lazy"
require "plugins.setup.lualine"
require "plugins.setup.telescope"
require "plugins.setup.lsp_config"
require "plugins.setup.treesitter"
require "plugins.setup.bufferline"
require "plugins.setup.nvim_tree"
require "plugins.setup.dap"
require "plugins.setup.null_ls"

require "Comment".setup {}
require "dapui".setup {}
-- require "centerpad".setup {}

require "plugins.config.mappings" -- Add custom mappings

require "plugins.setup.which_key" -- Last to load all mappings
