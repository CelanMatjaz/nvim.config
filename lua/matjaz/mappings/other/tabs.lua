local function rename_tab()
    local input = vim.fn.input("Rename tab: ")
    vim.cmd("TabRename " .. input)
end

require "matjaz.mappings.set".set_mappings({
    { "tt", "<cmd> tabnew <cr>",      desc = "New tab" },
    { "tc", "<cmd> tabclose <cr>",    desc = "Close tab" },
    { "tn", "<cmd> tabnext <cr>",     desc = "Next tab" },
    { "tN", "<cmd> tabprevious <cr>", desc = "Previous tab" },
    { "tr", rename_tab,               desc = "Rename tab" },
    { "tf", "<cmd> tabfirst <cr>",    desc = "First tab" },
    { "tl", "<cmd> tablast <cr>",     desc = "Last tab" },
})
