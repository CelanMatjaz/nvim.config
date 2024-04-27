local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Server configs
lspconfig.lua_ls.setup {}
lspconfig.csharp_ls.setup {}
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
lspconfig.intelephense.setup{}
lspconfig.ruby_lsp.setup{}

lspconfig.emmet_ls.setup {
    apabilities = capabilities,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
        html = {
            options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
}

require "plugins.utils".add_mappings({
    { "<leader>cs", "<cmd> ClangdSwitchSourceHeader <cr>", { desc = "Switch source/header" } },
})

require "plugins.utils".add_mappings({
    { "gf", vim.diagnostic.open_float, { desc = "LSP diagnostics" } },
    { "gt", vim.diagnostic.goto_next, { desc = "LSP diagnostics next" } },
    { "gz", vim.diagnostic.goto_prev, { desc = "LSP diagnostics prev" } },
    -- { "<leader>ls", vim.diagnostic.signature_help, { desc = "LSP signature_help" } },
    { "gm", function() vim.lsp.buf.format { async = true } end, { desc = "LSP formatting" } },
    { "ga", vim.lsp.buf.code_action, { desc = "LSP code action" } },
    { "gr", vim.lsp.buf.rename, { desc = "LSP rename" } },
    { "<C-space>", vim.lsp.buf.completion, { desc = "LSP code completion" } },
    { "gd", vim.lsp.buf.definition, { desc = "LSP definition" } },
    { "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" } },
    { "gi", vim.lsp.buf.implementation, { desc = "LSP implementation" } },
    { "K", vim.lsp.buf.hover, { desc = "LSP type definition" } },
}, "LSP")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "clangd", "csharp_ls", "cssls", "html" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

local luasnip = require "luasnip"
local cmp = require "cmp"

cmp.setup {
snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
               luasnip.expand_or_jump()
            else
               fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
               fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
}
