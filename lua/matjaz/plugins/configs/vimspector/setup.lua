local function generate_debug_profile()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")

    print("filetype " .. ft)


    if ft == "python" then
        -- Get Python path
        local python3 = vim.fn.exepath "python"
        local debugProfile = string.format(vimspector_python, python3)

        -- Generate debug profile in a new window
        vim.api.nvim_exec("vsp", true)
        local win = vim.api.nvim_get_current_win()
        local bufNew = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
        vim.api.nvim_win_set_buf(win, bufNew)

        local lines = {}
        for s in debugProfile:gmatch "[^\r\n]+" do
            table.insert(lines, s)
        end
        vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)
    else
        utils.info("Unsupported language - " .. ft, "Generate Debug Profile")
    end
end

local function toggle_human_mode()
    if vim.g.vimspector_enable_mappings == nil then
        vim.g.vimspector_enable_mappings = "HUMAN"
    else
        vim.g.vimspector_enable_mappings = nil
    end
end

vim.cmd [[packadd! vimspector]]
vim.g.vimspector_install_gadgets = {
    "delve",
    "netcoredbg",
    "CodeLLDB",
}
