local gitsigns = require "gitsigns"

require "matjaz.mappings.set".set_mappings({
	{ "<leader>gb", gitsigns.toggle_current_line_blame, desc = "Gitsigns toggle current line blame" },
	{ "<leader>gn", gitsigns.next_hunk, desc = "Gitsigns go to next hunk" },
	{ "<leader>gN", gitsigns.prev_hunk, desc = "Gitsigns go to prev hunk" },
})
