local dap = require "dap"
local dapui = require "dapui"

require "matjaz.mappings.set".set_mappings({
    { "<leader>dt", dapui.toggle,          desc = "Toggle dap-ui" },
    { "<leader>dr", dapui.close,           desc = "Close dap-ui" },
    { "<leader>de", dapui.open,            desc = "Open dap-ui" },
    { "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
    { "<leader>dc", dap.continue,          desc = "Continue" },
    { "<leader>do", dap.step_over,         desc = "Step over" },
    { "<leader>di", dap.step_into,         desc = "Step into" },
})
