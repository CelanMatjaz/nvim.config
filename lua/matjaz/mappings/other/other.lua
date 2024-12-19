local function toggle_wrap()
    vim.o.wrap = not vim.o.wrap
end

require "matjaz.mappings.set".set_mappings({
    { "tw", toggle_wrap,         desc = "Toggle wrap" },
    { "ts", "<cmd> source <cr>", desc = "Source" },
})
