local function set_mappings(mappings_array)
    for _, mapping in pairs(mappings_array) do
        local mode = "n"
        if mapping.mode ~= nil then
            mode = mapping.mode
        end

        vim.keymap.set(mode, mapping[1], mapping[2], { desc = mapping.desc } )
    end
end

return { set_mappings = set_mappings }
