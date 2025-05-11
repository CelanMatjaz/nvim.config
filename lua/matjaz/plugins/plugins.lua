local plugins = {
	{ "nvim-tree/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim" },
	{
		"tiagovla/scope.nvim",
		init = function() require("scope").setup({}) end
	},
	{ "nvim-lualine/lualine.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "stevearc/conform.nvim", },


	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		}
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = { "<leader>", "<c-r>", "<c-w>", "\"", "\'", "`", "c", "v", "g", "t" },
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" }
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag"
		}
	},

	{
		"sekke276/dark_flat.nvim",
		lazy = false,
	},

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},

	{
		"Badacadabra/vim-archery",
	},

	{
		"stevearc/oil.nvim",
		config = function(_, _)
			require("oil").setup({ view_options = { show_hidden = true }, columns = { "icon", "size", "mtime" } })
			vim.keymap.set("n", "-", "<CMD>Oil<CR>")
		end
	},

	{
		"williamboman/mason.nvim",
		config = function(_, opts)
			require("mason").setup(opts)
		end,
		dependencies = {
			{ "nvimtools/none-ls.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
		}
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			},
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {}
		end
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require "Comment".setup {}
		end
	},

	{
		"nanozuki/tabby.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		dependencies = { "nvim-lua/plenary.nvim", },
		keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
	},

	{
		"lewis6991/gitsigns.nvim",
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({ app = "browser" })
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},

	{
		"tpope/vim-dadbod"
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod",                     lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	{
		"tpope/vim-dotenv",
		keys = { { "<leader>se", "<cmd>SourceDotenvFile<cr>", desc = "Source .env file" } }
	},

	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		}
	},


	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat"
		}
	},
}

local function add_plugins_if_executables_exist(executables, plugin_array)
	local check_for_any_executable = function(executables_array)
		for _, exe in pairs(executables_array) do
			if vim.fn.executable(exe) == 1 then
				return true
			end
		end
	end

	if check_for_any_executable(executables) then
		for _, plugin in pairs(plugin_array) do
			table.insert(plugins, plugin)
		end
	end
end

add_plugins_if_executables_exist({ "rails" }, { { "tpope/vim-rails" } })
add_plugins_if_executables_exist({ "node", "deno" }, { { "mattn/emmet-vim" } })

return plugins
