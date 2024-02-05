local utils = {};

local allMappings = {
    default = {}
}

utils.whichKeyMappings = {}

utils.add_mappings = function(mappings, plugin)
    local mappingsKey = "default"

    if type(plugin) == "string" then
        mappingsKey = plugin
    end

    -- print (mappingsKey)
    -- print (#mappings)

    for _, m in pairs(mappings) do
        if #m > 1 then
            mappings[mappingsKey] = m
            utils.whichKeyMappings[m[2]] = { m[3], m[4] }
        else
            utils.whichKeyMappings[m[2]] = { m[3] }
        end
    end
end

utils.load_mappings = function()
    vim.schedule(function()
        for plugin, mappings in pairs(allMappings) do
            print ("Adding mappings for " .. plugin)
            for _, mapping in pairs(mappings) do
                vim.keymap.set(mapping[1], mapping[2], mapping[3])
            end
        end
    end)
end

return utils
