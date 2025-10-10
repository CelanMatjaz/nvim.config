require "matjaz.mappings.set".set_mappings({
    { "<leader>cd", "<cmd>VimspectorContinue<cr>",         desc = "Vimspector continue" },
    { "<leader>cs", "<cmd>VimspectorStop<cr>",             desc = "Vimspector stop" },
    { "<leader>cr", "<cmd>VimspectorRestart<cr>",          desc = "Vimspector restart" },
    { "<leader>cp", "<cmd>VimspectorPause<cr>",            desc = "Vimspector pause" },
    { "<leader>tt", "<cmd>VimspectorToggleBreakpoint<cr>", desc = "Vimspector toggle breakpoint" },
    { "<leader>tj", "<cmd>VimspectorStepOver<cr>",         desc = "Vimspector step over" },
    { "<leader>tk", "<cmd>VimspectorStepInto<cr>",         desc = "Vimspector step into" },
    { "<leader>tl", "<cmd>VimspectorStepOut<cr>",          desc = "Vimspector step out" },
})
