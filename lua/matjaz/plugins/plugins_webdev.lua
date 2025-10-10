return {
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

	-- {
	-- 	"rest-nvim/rest.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		opts = function(_, opts)
	-- 			opts.ensure_installed = opts.ensure_installed or {}
	-- 			table.insert(opts.ensure_installed, "http")
	-- 		end,
	-- 	}
	-- },
}
