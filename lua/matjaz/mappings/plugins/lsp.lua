local function toggleVirtualText()
    vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_text }
end

local function format()
    vim.lsp.buf.format { async = true }
end

local function hover()
    vim.lsp.buf.hover { border = { " ", " ", " ", " ", " ", " ", " ", " " } }
end

require "matjaz.mappings.set".set_mappings({
    { "gf",        vim.diagnostic.open_float,  { desc = "LSP diagnostics" } },
    { "gn",        vim.diagnostic.goto_next,   { desc = "LSP diagnostics next" } },
    { "gN",        vim.diagnostic.goto_prev,   { desc = "LSP diagnostics prev" } },
    { "gm",        format,                     { desc = "LSP formatting" } },
    { "ga",        vim.lsp.buf.code_action,    { desc = "LSP code action" },        mode = { "v", "n" } },
    { "gr",        vim.lsp.buf.rename,         { desc = "LSP rename" } },
    { "<C-space>", vim.lsp.buf.completion,     { desc = "LSP code completion" } },
    { "gd",        vim.lsp.buf.definition,     { desc = "LSP definition" } },
    { "gD",        vim.lsp.buf.declaration,    { desc = "LSP declaration" } },
    { "gi",        vim.lsp.buf.implementation, { desc = "LSP implementation" } },
    { "K",         hover,                      { desc = "LSP type definition" } },
    { "gt",        toggleVirtualText,          { desc = "LSP toggle virtual text" } },
    { "go",        "<cmd> LspRestart <cr>",    { desc = "Restart LSP" } }
})
