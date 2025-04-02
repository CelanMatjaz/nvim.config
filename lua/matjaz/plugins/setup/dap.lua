local dap = require "dap"
-- local dapui = require "nvim-dap-ui"

dap.adapters.coreclr = {
  type = 'executable',
  command = '/path/to/dotnet/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.setup {}
-- dapui.setup {}
