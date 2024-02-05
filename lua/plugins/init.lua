require "plugins.setup.lazy"
require "plugins.setup.lualine"
require "plugins.setup.telescope"
require "plugins.setup.lsp_config"

require "nvim-treesitter.configs".setup{}
require "bufferline".setup{}
require "Comment".setup{}

require "plugins.config.mappings" -- Add custom mappings

require "plugins.setup.which_key" -- Last to load all mappings
