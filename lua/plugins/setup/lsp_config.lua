local lspconfig = require('lspconfig')

-- Server configures

lspconfig.csharp_ls.setup {}

lspconfig.cssls.setup{}

lspconfig.html.setup{}

lspconfig.clangd.setup {}

require "utils".add_mappings({
    { { "n" }, "<leader>cs", "<cmd> ClangdSwitchSourceHeader <cr>", "Switch source/header" },
}, "telescope")

require "utils".add_mappings({
    { { "n" }, "<leader>lf", vim.diagnostic.open_float, "LSP diagnostics" },
    { { "n" }, "<leader>lp", vim.diagnostic.goto_next, "LSP diagnostics next" },
    { { "n" }, "<leader>ln", vim.diagnostic.goto_prev, "LSP diagnostics prev" },
    { { "n" }, "<leader>ls", vim.diagnostic.signature_help, "LSP signature_help" },
    { { "n" }, "<leader>fm", function() vim.lsp.buf.format { async = true } end, "LSP formatting" },
    { { "n" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action" },
    { { "n", "i" }, "<C-space>", vim.lsp.buf.completion, "LSP code completion" },
    { { "n" }, "<leader>gd", vim.lsp.buf.definition, "LSP definition" },
    { { "n" }, "<leader>gD", vim.lsp.buf.declaration, "LSP declaration" },
    { { "n" }, "<leader>K", vim.lsp.buf.hover, "LSP hover" },
    { { "n" }, "<leader>gi", vim.lsp.buf.implementation, "LSP implementation" },
    { { "n" }, "<leader>D", vim.lsp.buf.hover, "LSP type definition" },
}, "telescope")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "clangd", "csharp_ls", "cssls", "html" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

local luasnip = require 'luasnip'
local cmp = require "cmp"

cmp.setup {
snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
               luasnip.expand_or_jump()
            else
               fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
               fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
