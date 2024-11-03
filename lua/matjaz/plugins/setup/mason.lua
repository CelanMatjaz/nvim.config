local lsp = require "matjaz.lsp.lsp"

require "mason".setup {}
require "mason-lspconfig".setup {
    function(server_name)
        require "lspconfig"[server_name].setup {
            capabilities = require "cmp_nvim_lsp".default_capabilities(),
            on_attach = function(client) end
        }
    end,
    ensure_installed = lsp.ensure_installed_lsp_servers,
    automatic_installation = true,
}

return { lsp_servers = lsp.lsp_servers }
