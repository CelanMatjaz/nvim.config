local dap = require "dap"

dap.adapters.lldb = {
    type = "executable",
    command = "<PATH_TO_DEBUGGER>",
    name = "<NAME_OF_DEBUGGER>"
}

dap.configurations.c = {
    {
        name = "<NAME>",
        type = "<TYPE>",
        request = "launch",
        program = "<PATH_TO_EXECUTABLE>",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {}
    }
}