local pickers = require "telescope.pickers"
local conf = require "telescope.config".values
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function find_env_files()
    local env_files = vim.fn.systemlist("find . -type f -name '*.env'")
    return env_files
end

vim.api.nvim_create_user_command("SourceDotenvFile", function()
    pickers.new({}, {
        prompt_title = "Select an .env file to source",
        sorter = conf.generic_sorter(),
        finder = finders.new_table(find_env_files()),
        attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                local filepath = selection[1]
                vim.cmd("Dotenv " .. filepath)
            end)
            return true
        end,
    }):find()
end, {})
