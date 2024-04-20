local dap = require "dap"
local dapui = require "dapui"

local mappings = {
    { "<leader>dt", function() dapui.toggle() end, { desc = "Toggle dap-ui" } },
    { "<leader>dr", function() dapui.close() end, { desc = "Close dap-ui" } },
    { "<leader>de", function() dapui.open() end, { desc = "Open dap-ui" } },
    { "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" } },
    { "<leader>dc", function() dap.continue() end, { desc = "Continue" } },
    { "<leader>do", function() dap.step_over() end, { desc = "Step over" } },
    { "<leader>di", function() dap.step_into() end, { desc = "Step into" } },
}

require "plugins.utils".add_mappings(mappings, "dap")
