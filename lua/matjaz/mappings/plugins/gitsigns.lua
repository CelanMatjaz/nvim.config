local gitsigns = require "gitsigns"

require "matjaz.mappings.set".set_mappings({
    { "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Gitsigns toggle current line blame" } },
})
