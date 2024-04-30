local capabilities = require("cmp_nvim_lsp").default_capabilities()

require "mason".setup {}
require "mason-lspconfig".setup {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    ensure_installed = { 
        "lua_ls",
        "csharp_ls",
        "cssls",
        "html",
        "clangd",
        "gopls",
        "intelephense",
        "ruby_lsp",
        "emmet_ls",
    },
    automatic_installation = true,
}