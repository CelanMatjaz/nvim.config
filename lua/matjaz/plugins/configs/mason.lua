return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "nvimtools/none-ls.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function (_, opts)
		local mason = require "mason"
		local mason_lspconfig = require "mason-lspconfig"
		local lsp = require "matjaz.lsp.lsp_servers"

		require "mason".setup (opts)
		require "mason-lspconfig".setup {
			function(server_name)
				vim.lsp.config {
					capabilities = require "cmp_nvim_lsp".default_capabilities(),
					on_attach = function(client) end
				}
			end,
			ensure_installed = lsp.ensure_installed_lsp_servers,
			automatic_installation = true,
		}
	end
}
