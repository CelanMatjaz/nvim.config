
return {
	"nvim-treesitter/nvim-treesitter",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		local treesitter = require "nvim-treesitter.configs"
		treesitter.setup {
			ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "go", "glsl" },
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
	end
}
