return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require "gitsigns"

		local function goto_next_hunk()
			gitsigns.nav_hunk("next")
		end

		local function goto_prev_hunk()
			gitsigns.nav_hunk("prev")
		end

		gitsigns.setup {}

		require "matjaz.mappings.set".set_mappings({
			{ "<leader>gd",  gitsigns.diffthis,                  mode = "n", desc = "Diff this buffer" },
			{ "<leader>gw",  gitsigns.toggle_word_diff,          mode = "n", desc = "Toggle word diff" },
			{ "<leader>gbl", gitsigns.toggle_current_line_blame, mode = "n", desc = "Toggle line blame" },
			{ "<leader>ghs", gitsigns.stage_hunk,                mode = "n", desc = "Stage hunk" },
			{ "<leader>ghr", gitsigns.reset_hunk,                mode = "n", desc = "Reset hunk" },
			{ "<leader>ghn", goto_next_hunk,                     mode = "n", desc = "Go to next hunk" },
			{ "<leader>ghN", goto_prev_hunk,                     mode = "n", desc = "Go to prev hunk" },
			{ "<leader>gbs", gitsigns.stage_buffer,              mode = "n", desc = "Stage buffer" },
			{ "<leader>gbr", gitsigns.reset_buffer,              mode = "n", desc = "Reset buffer" },
		})
	end
}
