if vim.fn.executable("rails") == 0 then
    return
end

require "plugins.utils".add_mappings({
    { "<leader>rc", "<cmd> Econtroller <cr>", { desc = "Rails go to controller" } },
    { "<leader>rm", "<cmd> Emodel <cr>", { desc = "Rails go to model" } },
    { "<leader>rv", function ()
        local input = vim.fn.input("Go to view (method name): ")
        vim.cmd("Eview " .. input)
    end, { desc = "Rails go to view" } },
}, "LSP")
