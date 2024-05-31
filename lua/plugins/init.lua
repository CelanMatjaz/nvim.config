require "plugins.setup.lazy"
require "plugins.setup.lualine"
require "plugins.setup.telescope"
require "plugins.setup.mason"
require "plugins.setup.lsp_config"
require "plugins.setup.treesitter"
require "plugins.setup.bufferline"
require "plugins.setup.nvim_tree"
require "plugins.setup.dap"
require "plugins.setup.null_ls"

require "Comment".setup {}
require "dapui".setup {}
require "luasnip".setup {}
require "luasnip.loaders.from_vscode".lazy_load { { paths = { "./snippets/typescriptreact.json" } } }

require "plugins.config.rails_mappings" -- Setup rails mappings
require "plugins.config.mappings"       -- Add custom mappings

require "plugins.setup.which_key"       -- Last to load all mappings

require "plugins.autocommands" -- Setup autocommands
