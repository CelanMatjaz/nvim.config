local function execute_code_action(kind)
    local params = vim.lsp.util.make_range_params()
    params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }

    vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, result, ctx)
        if err then
            vim.notify("Error retrieving code actions: " .. err.message, vim.log.levels.ERROR)
            return
        end

        if result == nil then return end

        for _, action in ipairs(result) do
            if action.kind == kind then
                if action.edit then
                    vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
                else
                    vim.lsp.buf.execute_command(action.command)
                end
                vim.cmd("write")
                return
            end
        end
    end)
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*.go",
    callback = function()
        execute_code_action("source.organizeImports")
    end
})
