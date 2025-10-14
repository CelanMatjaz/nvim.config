local lsp_servers = require "matjaz.lsp.lsp_servers"

local capabilities = require "cmp_nvim_lsp".default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup LSP servers
for _, server in pairs(lsp_servers.lsp_servers) do
	if type(server) == "string" then
		vim.lsp.enable(server)
		vim.lsp.config(server, { capabilities = capabilities, on_attach = function(client) end })
	else
		if type(server) == "table" then
			vim.lsp.enable(server.name)
			server.custom_config.capabilities = capabilities
			-- server.custom_config.on_attach = server.on_attach
			vim.lsp.config(server.name, server.custom_config)
		end
	end
end
