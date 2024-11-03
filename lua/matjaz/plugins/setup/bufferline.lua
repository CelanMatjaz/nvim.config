local bufferline = require "bufferline"

bufferline.setup {
    options = {
        style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold
        },
        hover = {
            enabled = true,
            reveal = { "close" }
        },
        offsets = {
            {
                filetype = "NvimTree",
                highlight = "Directory",
            }
        },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    }
}
