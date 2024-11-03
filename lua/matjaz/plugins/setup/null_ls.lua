local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.sharp_ls,
    },
    on_attach = function(client, bufnr)
        vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() 
                vim.lsp.buf.format({ bufnr = bufnr })
            end
        })
    end
}
