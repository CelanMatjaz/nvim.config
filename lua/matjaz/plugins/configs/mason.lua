return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "nvimtools/none-ls.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function(_, opts)
		local mason = require "mason"
		local mason_lspconfig = require "mason-lspconfig"

		local lsp = require "matjaz.lsp.lsp_servers"

		mason.setup(opts)
		mason_lspconfig.setup {
			function(server_name)
				print(server_name)
				vim.lsp.config(
					server_name, {
						capabilities = require "cmp_nvim_lsp".default_capabilities(),
						on_attach = function(client) end
					}
				)
			end,
			ensure_installed = lsp.ensure_installed_lsp_servers,
			automatic_installation = true,
		}
	end
}
