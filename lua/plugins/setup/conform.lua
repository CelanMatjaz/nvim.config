local conform = require "conform"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

conform.setup {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
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
