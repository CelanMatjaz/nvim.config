local utils = {};

local options = { noremap = true, silent = true }

utils.whichKeyMappings = {}
utils.mappings = {}

utils.add_mappings = function(mappings, plugin)
    local mappingsKey = "default"

    if type(plugin) == "string" then
        mappingsKey = plugin
    end

    for _, m in pairs(mappings) do
        if m[3] ~= nil then
            table.insert(utils.whichKeyMappings, { m[1], desc = m[3].desc })
        end

        utils.mappings[m[1]] = { m[2], m[3], m[4] }
    end
end

utils.load_mappings = function()
    vim.schedule(function()
        for cmd, mapping in pairs(utils.mappings) do
            local modes = "n"
            if mapping[3] ~= nil then
                modes = mapping[3]
            end

            vim.keymap.set(modes, cmd, mapping[1])
        end
    end)
end

return utils
