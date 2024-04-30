local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_servers = { 
    "lua_ls",
    -- "csharp_ls",
    "cssls",
    "html",
    "clangd",
    -- "gopls",
    -- "intelephense",
    "solargraph",
    "ruby_lsp",
    "emmet_ls",
}

require "mason".setup {}
require "mason-lspconfig".setup {
    function (server_name) -- default handler (optional)
        require"lspconfig"[server_name].setup {
            capabilities = capabilities,
            on_attach = function(client) 
            end
        }
    end,
    ensure_installed = lsp_servers,
    automatic_installation = false,
}

return { lsp_servers = lsp_servers }
